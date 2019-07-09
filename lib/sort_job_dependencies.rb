require "tsort"
 
class SortJobDependencies
  include TSort
 
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
         
    sorted_job_dds.each do |jobs_string|
      job, dependency = jobs_string.split(" => ")
               
      if job === dependency
        raise "Job #{job} cannot depend on self."
      elsif dependency === nil
        add_job_dependency(job)
      else
        add_job_dependency(job, dependency)
      end              
    end
  end
 
  # The two methods below are required in order for TSort to work
  def tsort_each_node(&block)
    @dependencies.each_key(&block)
  end
 
  def tsort_each_child(job, &block)
    @dependencies[job].each(&block) if @dependencies.has_key?(job)
  end
end