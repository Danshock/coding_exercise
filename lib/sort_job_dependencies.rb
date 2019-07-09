require "tsort"

class SortJobDependencies
	include TSort

	# initialize with a default value = []
	def initialize
		@dependencies = Hash.new { |j, d| j[d] = [] }
	end

	# The below two methods are required in order for TSort to work
	def tsort_each_node(&block)
		@dependencies.each_key(&block)
	end

	def tsort_each_child(job, &block)
		@dependencies[job].each(&block) if @dependencies.has_key?(job)	
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
		sort_job_dependencies.jobs_splitter(string_of_jobs)
		sort_job_dependencies.tsort.join
	end
end