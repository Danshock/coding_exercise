class SortJobDependencies

	# initialize with a default value = []
	def initialize
		@dependencies = Hash.new { |j, d| j[d] = [] }
	end

	def add_job_dependency(job, *job_dependencies)
		@dependencies[job] = job_dependencies
	end

	def jobs_splitter(unsorted_job_dependencies)
		sorted_job_dds = unsorted_job_dependencies.split(", ")
		sorted_job_dds.each do |s|
			k, v = s.split(" => ")
			@d = add_job_dependency(k, v)
		end
	end

	def sort_jobs(string_of_jobs)
		sort_job_dependencies = SortJobDependencies.new
		sort_job_dependencies.jobs_splitter(string_of_jobs).join
	end
end