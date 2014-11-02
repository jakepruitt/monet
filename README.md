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

Usage (development)
-----

First you will need to clone the project.

Then you will need to use bundle to install the dependencies that are listed in the Gemfile.
Do this with `bundle install --without production --path vendor/bundle`.
This will install all dependencies into `vendor/bundle`.
When running any rails or rake commands that are not in the `bin` folder, you will need to prefix them with `bundle exec` so that they are run with the correct versions of dependencies.

You will also need to install **imagemagick**.
This is not a Ruby Gem, so you will have to find the installation method for your platform.

Next, you will need to apply all migrations to your database.
Do this with `bin/rake db:migrate`

<!--
Then you need to generate the secret key which allows the rails server to sign cookies. Create a new file `config/secrets.yml`, and write the following into it.
```yml
development:
  secret_key_base: XXX
```
Where XXX is a key generated with `bin/rake secret`.
-->

Now, you will need to set up the credentials for Amazon S3.
These will not saved in any file, so we pass them to the server through environmental variables.
In the shell that you are going to run the server from, run the following commands.

```bash
export S3_BUCKET_NAME=XXX
export AWS_ACCESS_KEY_ID=XXX
export AWS_SECRET_ACCESS_KEY=XXX
```

Then you are ready to run the server with `bundle exec bin/rails server`.

<!--
### Migrating to PostgreSQL
In order to run Monet on Heroku, we need to switch our database to PostgreSQL.
Heroku recommends that we maintain a consistent environment and run the same database in both the development and production environment, and regardless I wasn't able to get the Heroku deploy to work with `sqlite3` in the `Gemfile`, even as a development-only dependency.

After you've pulled the changes that include the migration to PostgreSQL, you will need to set up a PostgreSQL instance on your machine. On mine it went something like:
1. Install `postgresql` package.
2. Switch to `postgres` user and run `initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'`
3. Start the PostgreSQL service. With systemd it's `systemctl start postgresql`
4. Switch to the `postgres` user again and run `createuser --interactive`, enter your username and yes to supervisor when prompted.

Then, in the application root, run `bin/rake db:create` and `bin/rake db:migrate`. You should be all set.
-->

## Production Deployment

Set the following config vars on Heroku:
- `SECRET_KEY_BASE`
- `S3_BUCKET_NAME`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
