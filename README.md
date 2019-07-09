## Sort Job Dependencies 
My solution to the coding exercise

# Installation

Download or clone the repo

    $ git clone https://github.com/Danshock/coding_exercise.git

cd into the directory and run:

    $ bundle exec rspec

Open Terminal / iTerm2 / etc and run:

    $ irb -r ./lib/sort_job_dependencies.rb

Initialize a new SortJobDependencies object

    $ class_instance = SortJobDependencies.new

Run the ```sort_jobs()``` method on the SortJobDependencies object with the jobs you want to sort:

    $ class_instance.sort_jobs("a => , b => c, c => ") => acb
    $ class_instance.sort_jobs("a => , b => c, c => f, d => a, e => b, f => ") => afcbde
    $ class_instance.sort_jobs(" a => , b => , c => c") => RuntimeError (Job c cannot depend on self.)


## Coding exercise

Imagine we have a list of jobs, each represented by a character. Because certain jobs must be done before others, a job may have a dependency on another job. For example, a may depend on b, meaning the final sequence of jobs should place b before a. If a has no dependency, the position of a in the final sequence does not matter.

* Given you're passed an empty string (no jobs), the result should be an empty sequence.

* Given the following job structure:

`a => `

The result should be a sequence consisting of a single job a.

* Given the following job structure:

`a => `

`b => `

`c =>`

The result should be a sequence containing all three jobs abc in no significant order.

* Given the following job structure:

`a =>`

`b => c`

`c =>`

The result should be a sequence that positions c before b, containing all three jobs abc.

* Given the following job structure:

`a =>`

`b => c`

`c => f`

`d => a`

`e => b`

`f =>`

The result should be a sequence that positions f before c, c before b, b before e and a before d containing all six jobs abcdef.

* Given the following job structure:

`a =>`

`b =>`

`c => c`

The result should be an error stating that jobs can't depend on themselves.

* Given the following job structure:

`a =>`

`b => c`

`c => f`

`d => a`

`e => `

`f => b`

The result should be an error stating that jobs can't have circular dependencies.
