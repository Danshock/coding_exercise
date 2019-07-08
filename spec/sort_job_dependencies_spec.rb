require "sort_job_dependencies"

describe SortJobDependencies do
  describe ".sort_jobs" do
	let(:sort_job_dependencies) { SortJobDependencies.new }

	context "given an empty string" do
		let(:string_of_jobs) { "" }

		it "should equal 0 elements" do
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

		it "should equal 1 element" do
			expect(string_of_jobs.size).to eq(1)
		end

		it "is an object of type String" do
			expect(string_of_jobs).to be_a(String)
		end
	end
  end
end