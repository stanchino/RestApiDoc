== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

# RestApiDoc 

## What is RestApiDoc?
RestApiDoc is a tool for creating, running and sharing automated acceptance tests for RESTful APIs. The test suites and projects can be published to provide a wiki-style documenation of the API being tested.

## Contributing

### Recommended development environment

#### Mac users

Here is a nice [tutorial](http://thedrearlight.com/blog/tmux-vim.html) about setting up the development environment on a Mac. We highly recommend the following tools:

* Latest Xcode with command line tool installed
* [Hombrew](http://mxcl.github.com/homebrew/)
* [RVM](https://rvm.io/)
* [Janus](https://github.com/carlhuda/janus)
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [iTerm](http://www.iterm2.com/#/section/home)
* [Tmux](http://tmux.sourceforge.net/)
* [Postgres 9.1.x](http://www.enterprisedb.com/products-services-training/pgdownload#osx) The project uses the latest 9.1.x PostgreSQL release.

### Project Set Up

RestApiDoc is a [Ruby on Rails](http://rubyonrails.org/) application that uses [Ruby](https://www.ruby-lang.org/en/) v2.0.0.
The project includes a .ruby-version and .ruby-gemset files that will automatically load the current version for you if you are using [rvm](https://rvm.io/).

To clone the code from the lastest GitHub commit run:

```
git clone git@github.com:stanchino/respassare-app.git passare && cd passare
git clone git@github.com:stanchino/RestApiDoc.git rest-api-doc && cd rest-api-doc
```

To install all development dependencies on the project (this might take a few minutes):
```
bundle install
```

To create the database you will need to copy the default database config file and run the appropriate rake tasks like so:
```

cp config/database.sample.yml config/database.yml

rake db:create db:migrate db:test:prepare
```

```
To seed the database data run:

```
rake db:seed
```
