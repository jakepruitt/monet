Monet
=====

![Travic CI build status](https://travis-ci.org/jrpruit1/monet.svg?branch=master)

Simple Ruby on Rails application for storing and editing images online.  Group project for CSE 360.  For any questions, email me at [jrpruit1@asu.edu](mailto:jrpruit1@asu.edu), or reach out to me on Twitter at [@thejakepruitt](http://www.twitter.com/thejakepruitt) :)

Project Requirements
--------------------

TODO add links to files...

Open Source resources
---------------------

* [Ruby on Rails](http://api.rubyonrails.org/)
* [Ruby](http://ruby-doc.org/core-1.9.3/)
* [Paperclip](https://github.com/thoughtbot/paperclip)
* [Unicorn](http://unicorn.bogomips.org/)
* [Clearance](https://github.com/thoughtbot/clearance)
* [CamanJS](http://camanjs.com/)

Services
--------

* [Heroku](https://www.heroku.com/)
* [TravisCI](https://travis-ci.org/jrpruit1/monet)
* [Balsamiq](https://cse360teammonet.mybalsamiq.com/projects/monet/grid)

Usage
-----

First you will need to clone the project.

Then you will need to use bundle to install the dependencies that are listed in the Gemfile.
Do this with `bundle install`.
This will install all dependencies into `vendor/bundle`.
When running any rails or rake commands you will need to prefix them with `bundle exec` so that they are run with the correct versions of dependencies.

You will also need to install **imagemagick**.
This is not a Ruby Gem, so you will have to find the installation method for your platform.

Next, you will need to apply all migrations to your database.
Do this with `bundle exec bin/rake db:migrate`

Now, you will need to set up the credentials for Amazon S3.
These will not saved in any file, so we pass them to the server through environmental variables.
In the shell that you are going to run the server from, run the following commands.

```bash
export S3_BUCKET_NAME=XXX
export AWS_ACCESS_KEY_ID=XXX
export AWS_SECRET_ACCESS_KEY=XXX
```

Then you are ready to run the server with `bundle exec bin/rails server`.
