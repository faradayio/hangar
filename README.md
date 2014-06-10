# Hangar

Hangar is a Rails Engine that exposes your [FactoryGirl](https://github.com/thoughtbot/factory_girl) factories with a REST API available in the test environment only

## Install

Add Hangar to your application's Gemfile:

``` ruby
gem 'hangar', group: :test
```

## Requirements

Your application must use FactoryGirl to manage its factories. Follow [FactoryGirl's documentation](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md) to add factories to your application.

## Configuration

### Protecting tables from deletion

You may have special tables in your test database that should not be cleared by Hangar after a `DELETE /` request (see below in Usage). In this case, create an initializer in your app as follows:

``` ruby
# config/initializers/hangar.rb

Hangar.do_not_delete = %w(very_important_things valuable_bitcoin_keys spatial_ref_sys) if defined?(Hangar)
```

## Usage

Hangar will create two factory routes for each factory registered with FactoryGirl. These routes mimic FactoryGirl's `create` and `attributes_for` methods, respectively:

```
POST /posts
GET /posts/new
```

Both will respond with a JSON representation of the object.

Hangar also provides a route to clean the database after each test:

```
DELETE /
```

This returns 204 No Content when successful.

### Attributes

You may specify attributes with your GET and POST requests using JSON as follows:

```
{ "post": { "title": "Dolor Sit Amet" } }
```

### Headers

You must include the following headers with your requests:

```
Accept: application/json; charset=utf-8
Factory: hangar
```

## Security

Hangar is designed to run in the *test environment only*. A warning will be displayed if it is loaded in any other environment.

## Corporate support

<p><a href="http://faraday.io"><img src="https://s3.amazonaws.com/creative.faraday.io/logo.png" alt="Faraday logo"/></a></p>

We use `hangar` for [marketing analytics at Faraday](http://faraday.io).

## Copyright

Copyright 2014 Andy Rossmeissl
