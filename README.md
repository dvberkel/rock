Tantrix Rock
============

[![Build Status](https://secure.travis-ci.org/dvberkel/rock.png?branch=master)](http://travis-ci.org/dvberkel/rock)

[Tantrix Rock][1] is a puzzle game inspired by the famous [Tantrix][2]
puzzle. The object of the puzzle is to place hexagonal and square
tiles on a truncated [octohedron][3] such that the colored lines all
match up.

This project aims to provide software which is able to find all the
solutions to the puzzle.

Environment
-----------

We are using [Ruby][4] in conjunction with the Ruby Version Manager
([rvm][5]). The specific version of ruby we started out with is 1.9.3
installed with the following command.

    $ rvm install 1.9.3

There is a `.rvmrc` file which choses this ruby version by executing
the following command

    $ rvm use 1.9.3@rock

The part after the '@' determines the [gemset][6] which we will be using.

Furthermore we will be using [bundler][7] to manage our
dependencies. Execute the following command to install all
dependencies needed for the project

    $ bundle install

Running tests
-------------

[Rake][8] is used to automate the test run. You run all tests by
executing the following command

    $ bundle exec rake

This is the same command that is used by [Travis CI][9].

[1]: http://www.jaapsch.net/puzzles/tantrix.htm#rock "Tantrix Rock on Jaap's Puzzle page" 
[2]: http://en.wikipedia.org/wiki/Tantrix "Wikipedia on Tantrix"
[3]: http://en.wikipedia.org/wiki/Truncated_octahedron "Wikipedia on Truncated Octohedron"
[4]: http://www.ruby-lang.org/en/ "Homepage for the Ruby programming language"
[5]: https://rvm.io/ "Homepage for the Ruby Version Manager"
[6]: https://rvm.io/gemsets/ "rvm documentation about gemsets"
[7]: http://gembundler.com/ "Bundler homepage"
[8]: http://rake.rubyforge.org/ "Rake Homepage"
[9]: http://travis-ci.org/ "Travis CI landing page"

