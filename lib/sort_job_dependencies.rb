require "tsort"

class SortJobDependencies
	include TSort

	def self_dependency_error(k)
		raise "Jobs cannot depend on themselves."
	end

	# initialize with a default value = []
	def initialize
		@dependencies = Hash.new { |job, dep| job[dep] = [] }
	end

	def sort_jobs(string_of_jobs)
		jobs_splitter(string_of_jobs)
		tsort.join
	end

	private

	def add_job_dependency(job, *job_dependencies)
		@dependencies[job] = job_dependencies
	end

	def jobs_splitter(unsorted_job_dependencies)
		sorted_job_dds = unsorted_job_dependencies.split(", ")
		  sorted_job_dds.each do |s|
			  k, v = s.split(" => ")
			    if k === v
				  raise self_dependency_error(k)
			    elsif v === nil
				  add_job_dependency(k)
			    else
				  add_job_dependency(k, v)
			    end				
		  end
	end

	# The below two methods are required in order for TSort to work
	def tsort_each_node(&block)
		@dependencies.each_key(&block)
	end

	def tsort_each_child(job, &block)
		@dependencies[job].each(&block) if @dependencies.has_key?(job)	
	end

end