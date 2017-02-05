# Questionaire 

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This app is a simple question storage.

This app build with [Rails](http://rubyonrails.org) framework.

## How to Setup

You have to install [Ruby](https://www.ruby-lang.org) version ` >= 2.3.0` and [Bundler](http://bundler.io) first

- clone/download this repository

- run `bundle install`

- run `bundle exec rake db:create db:migrate`

- run you Rails server with `rails s`

# Testing

You can run test with `bundle exec rake test` for all test, 

or `bundle exec rake test:models` for model/unit test only

and `bundle exec rake test:controllers` for controller test only
