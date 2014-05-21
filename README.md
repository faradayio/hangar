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

None.

## Usage

Hangar will create two factory routes for each factory registered with FactoryGirl. These routes mimic FactoryGirl's `create` and `attributes_for` methods, respectively:

```
POST /posts
GET /posts/new
```

Both will respond with a JSON representation of the object.

### Attributes

You may specify attributes with your requests using JSON as follows:

```
{ "post": { "title": "Dolor Sit Amet" } }
```

### Headers

You must include the following headers with your requests:

```
Content-Type: application/json; charset=utf-8
X-Factory: hangar
```

## Security

Hangar is designed to run in the *test environment only*. A warning will be displayed if it is loaded in any other environment.