# Quiz Master

[![Build Status](https://travis-ci.org/prihandi/Quiz-Master.svg?branch=master)](https://travis-ci.org/prihandi/Quiz-Master)

This app is a simple question storage.

This app build with [Rails](http://rubyonrails.org) framework.

## How to Setup

You have to install [Ruby](https://www.ruby-lang.org) version ` >= 2.3.0` and [Bundler](http://bundler.io) first

- clone/download this repository

- run `bundle install`

- run `bundle exec rake db:create db:migrate db:seed`

- run you Rails server with `rails s`

## Testing

You can run test with `bundle exec rake test` for all test, 

or `bundle exec rake test:models` for model/unit test only

and `bundle exec rake test:controllers` for controller test only

## Deployment

You can deploy it on [Heroku](http://heroku.com) instantly by clicking this button

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

or you can simply deploy to your hosting provider like another Ruby on Rails app.