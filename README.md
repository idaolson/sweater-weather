# README
![sweater-weather](https://user-images.githubusercontent.com/81930253/141661300-c170b69c-fe03-452d-91a5-17c7c9008016.jpg)

# Sweater Weather  [![CircleCI](https://circleci.com/gh/idaolson/sweater-weather/tree/main.svg?style=shield)](https://app.circleci.com/pipelines/github/idaolson/sweater-weather)

## Table of contents
* [Description](#description)
* [Learning Goals](#learning-goals)
* [Requirements](#requirements)
* [Setup](#setup)
* [Tools Used](#tools-used)
* [Contributors](#contributors)

## Description

Sweater Weather is the back-end of road-trip planning application. This app will allow users to see the current/daily/hourly weather at a destination and a background image from that destination (based on weather conditions and time of day). It also suggests activities for user based on the weather at a specified location and assists in planning a road trip from one destination to another, providing estimated travel time and a forecast of the weather at the end location upon arrival. 

## Learning Goals
- Expose an API that aggregates data from multiple external APIs.
- Expose an API that requires an authentication token.
- Determine completion criteria based on the needs of front-end developers.
- Research, select, and consume an API based on project needs.

## Requirements
- Rails 5.2.5
- Ruby 2.7.2
- PostgreSQL
- CircleCI
- Test-driven development

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
    ```
      map_quest_key: <your key>
      open_weather_key: <your key>
      unsplash_access_key: <your key>
      ``` 
* Run the test suite with `bundle exec rspec`.
* Run RuboCop linter with `bundle exec rubocop`.
* Run your development server with `rails s` to see the app in action.

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
