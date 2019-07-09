require "sort_job_dependencies"

describe SortJobDependencies do
  describe ".sort_jobs" do
    let(:sort_job_dependencies) { SortJobDependencies.new }

	context "given an empty string" do
	  let(:string_of_jobs) { "" }

		it "should equal 0 jobs" do
			expect(string_of_jobs.size).to eql(0)
		end

		it "is an object of type String" do
			expect(string_of_jobs).to be_a(String)
		end

		it "should return an empty sequence" do
			expect(string_of_jobs.split).to eql([])
		end
	end

	context "given the single job \"a =>\"" do
	  let(:string_of_jobs) { "a" }

		it "returns \"a\"" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs)).to eq("a")
		end

		it "should equal 1 job" do
			expect(string_of_jobs.size).to eq(1)
		end
	end

	context "given a sequence of three jobs \"a =>\", \"b =>\", \"c =>\"" do
	  let(:string_of_jobs) { "a => , b => , c => " }

		it "returns \"abc\"" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs)).to eq("abc")
		end

		it "should equal 3 jobs" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs).size).to eq(3)
		end
	end

	context "given a sequence of three jobs with one dependency \"a =>\", \"b => c\", \"c =>\"" do
	  let(:string_of_jobs) { "a => , b => c, c => " }

		it "returns \"acb\"" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs)).to eq("acb")
		end

		it "should equal 3 jobs" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs).size).to eq(3)
		end
	end

	context "given a sequence of six jobs with four dependencies \"a => , b => c, c => f, d => a, e => b, f =>\"" do
	  let(:string_of_jobs) { "a => , b => c, c => f, d => a, e => b, f => " }

		it "returns \"afcbde\"" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs)).to eq("afcbde")
		end

		it "should equal 6 jobs" do
			expect(sort_job_dependencies.sort_jobs(string_of_jobs).size).to eq(6)
		end
	end

	context "given a sequence of three jobs with a job depending on self \"a => , b => , c => c\"" do
	  let(:string_of_jobs) { "a => , b => , c => c" }

		it "raises an error: Job c cannot depend on self." do
			expect{sort_job_dependencies.sort_jobs(string_of_jobs)}.to raise_error(RuntimeError, "Job c cannot depend on self.")
		end
	end

	context "given a sequence of six jobs with a circular dependency \"a => , b => c, c => f, d => a, e => , f => b\"" do
	  let(:string_of_jobs) { "a => , b => c, c => f, d => a, e => , f => b" }
 
		it "raises an error: Circular Dependencies are not allowed. Please correct your dependencies." do
			expect{sort_job_dependencies.sort_jobs(string_of_jobs)}.to raise_error(TSort::Cyclic)
		end
	end
  end
end
