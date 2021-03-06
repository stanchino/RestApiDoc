# RestApiDoc 

## What is RestApiDoc?
RestApiDoc is a tool for creating, running and sharing automated acceptance tests for RESTful APIs. The test suites and projects can be published to provide a wiki-style documenation of the API functionality.

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
The project includes a [.ruby-version](.ruby-version) and [.ruby-gemset](.ruby-gemset) files that will automatically load the current version for you if you are using [RVM](https://rvm.io/).

To clone the code from the lastest GitHub commit run:
```
git clone git@github.com:stanchino/RestApiDoc.git rest-api-doc && cd rest-api-doc
```

To install all development dependencies on the project (this might take a few minutes):
```
bundle install
```

To create the database you will need to copy the default database config file and run the appropriate rake tasks like so:
```
cp config/database.sample.yml config/database.yml

rake db:create db:migrate db:test:load db:test:prepare
```

In order to populate the database with sample data run:
```
rake db:seed
```

### Running the App

The default application server that is configured is [Unicorn](http://unicorn.bogomips.org/). There is also a [Procfile](https://devcenter.heroku.com/articles/procfile) you can use to deploy to [Heroku](https://www.heroku.com/). In order to start the application locally you will need to configured your some [environment variables](#environment-variables) and then run:
```
rails server unicorn
```

#### Environment Variables
 * MAIL_HOSTNAME - The SMTP server hostname used for sending emails
 * MAIL_PORT - The SMTP server port
 * MAIL_USERNAME - Username to be used for SMTP authentication
 * MAIL_PASSWORD - Password to authenticate agains the SMTP server
 * HTTPAUTH_USERNAME - Basic HTTP authentication username to access the applciation
 * HTTPAUTH_PASSWORD - Basic HTTP authentication password to access the application

Note: If you don't provide HTTPAUTH_USERNAME or HTTPAUTH_PASSWORD HTTP Basic Authentication will be disabled.
