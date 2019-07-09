## Notes

While reading the first bullet points of this coding exercise, I thought that an if/else statement would do the trick, but then reading further down things got too complicated for an if/else solution. I noticed that I need to sort the jobs based on their dependencies, so I started googling for hints on what is the base course of action. I have found that what I needed was a topological sort for a directed acyclic graph which is a linear ordering of its vertices such that for every directed edge uv from vertex u to vertex v, u comes before v in ordering.

Instead of reinventing the wheel, and because of time constraints (on my end), I have decided to use the TSort module (https://ruby-doc.org/stdlib-2.4.1/libdoc/tsort/rdoc/TSort.html) that comes with the standard ruby library. 

There are also gems such as topiary which provide the required functionality for solving this problem, however, I wanted to use Ruby's standard library as this way it is less dependent on 3rd parties. 

If I had more time I would have probably rolled my own implementation of the TSort module.

# Workflow

I used the TDD approach. Building the tests first, making them fail, afterwards make them pass, and then refactor whatever I can. Furthermore, for each bullet point from the challenge, I have used different branches to avoid making unwanted changes or breaking the master branch. This gives me the flexibility to discard any work that I am not happy with without too much hassle.

Once the assignment was completed, I went back to refactor the code. I noticed that in my sort_jobs method I had some duplication with creating an instance method. It was not needed as I do create a SortJobDependency object from my tests and then call a method that creates one.

For the jobs_splitter method I renamed some of the variables to be more descriptive and also fixed lines where I had more than two spaces for indentation.

# Considerations

When refactoring the RSpec file, I removed the tests (apart from the first) which tests if the variable I set (string_of_jobs) in the test is a string. I don't consider it to be valuable considering it doesn't actually confirm what would happen if I get an input that wasn't a string.

Raising a RunTimeError will break/quit the application on the first job that depends on itself. If there were several jobs that depend on themselves, I would need to run the application each time to see how many there were and fix them on by one. Instead of raising right away, I could have collected all the jobs that depend on themselves and then raise at the end listing out which ones are dependent on themselves.

I also have considered rolling out a custom exception but didn't have enough information to decide if it was worth it. If there was information regarding some custom behaviour, then I would create a custom exception. As of now, in my opinion, I think the method is pretty clear at what it does. 


# Research material 

* https://github.com/ruby/ruby/blob/trunk/lib/tsort.rb

* https://blog.bigbinary.com/2012/03/16/tsort-in-ruby.html

* https://www.klausrubrecht.com/rubys-tsort-explained/  

* http://www.monkeyandcrow.com/blog/ruby_standard_library_tsort/

* https://www.viget.com/articles/dependency-sorting-in-ruby-with-tsort/

* https://en.wikipedia.org/wiki/Topological_sorting

