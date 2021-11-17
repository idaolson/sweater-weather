# README
![sweater-weather](https://user-images.githubusercontent.com/81930253/141661300-c170b69c-fe03-452d-91a5-17c7c9008016.jpg)

# Sweater Weather  [![CircleCI](https://circleci.com/gh/idaolson/sweater-weather/tree/main.svg?style=shield)](https://app.circleci.com/pipelines/github/idaolson/sweater-weather)

## Table of contents
* [Description](#description)
* [Learning Goals](#learning-goals)
* [Requirements](#requirements)
* [Database Schema](#database-schema)
* [Setup](#setup)
* [Live App](#live-app)
* [Tools Used](#tools-used)
* [Contributors](#contributors)

## Description

"Whether, sweater?" is the back-end of a hypothetical application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs.
- Expose an API that requires an authentication token.
- Determine completion criteria based on the needs of front-end developers.
- Research, select, and consume an API based on your needs as a developer.

## Requirements
- Rails 5.2.5
- Ruby 2.7.2
- PostgreSQL
- Circle CI
- Test all feature and model code
- Deploy completed code to Heroku

## Database Schema


## Setup
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`
* Create an account with Open Weather Map and request an API key.
* Create an account with Mapquest and request an API key.
* Create an account with Unsplash and request an API key.
* install teh Figaro gem and run
    * `bundle exec figaro install`
    * Add your API keys to `config/application.yml`
* Run the test suite with `bundle exec rspec`.
* Run RuboCop linter with `bundle exec rubocop`.
* Run your development server with `rails s` to see the app in action.

```
  OPEN_WEATHER_KEY: your_api_key
  MAPQUEST_KEY: your_mapquest_key
  UNSPLASH_KEY: your_unsplash_key
``` 

## Live App
[Link to Heroku deployment(find user by email endpoint)](https://sweater-weather-denver.herokuapp.com/api/v1/users?email=danny@gmail.com)

## Tools Used

| Development         |  Testing        |
| :------------------:| :--------------:|
| Ruby 2.7.2          | RSpec           |
| Rails 5.2.6         | SimpleCov       |
| PostgreSQL          | CircleCI        |
| Postman             | RuboCop         |
| Bcrypt              | VCR             |
| JSON:API Serializer | Webmock.        |
| Faraday             |                 |
| Figaro              |                 |
| Git                 |                 |

## Contributor

- [Ida Olson](https://github.com/idaolson/)


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
