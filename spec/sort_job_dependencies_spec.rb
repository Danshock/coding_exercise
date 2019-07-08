require "sort_job_dependencies"

describe SortJobDependencies do
	let(:sort_job_dependencies) { SortJobDependencies.new }

	context "given an empty string" do
		let(:string_of_jobs) { "" }

		it "should equal zero elements" do
			expect(string_of_jobs.size).to eql(0)
		end

		it "is an object of type String" do
			expect(string_of_jobs).to be_a(String)
		end

		it "should return an empty sequence" do
			expect(string_of_jobs.split).to eql([])
		end
	end
end