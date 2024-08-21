# HabtmGenerator

[![Build Status](https://travis-ci.org/zealot128/ruby-htm-generator.svg?branch=master)](https://travis-ci.org/zealot128/ruby-htm-generator)
[![Gem Version](https://badge.fury.io/rb/htm_generator.svg)](https://badge.fury.io/rb/htm_generator)

## Installation

Add this line to your application's Gemfile:

    gem 'htm_generator', :group => :development

And then execute:

    $ bundle


## Usage


```bash
rails generate htm user post
```

This will generate a migration, for:
* creating table "posts\_users" with user\_id, post\_id, no primary key
* index on both columns

And will copy the "has\_and\_belongs\_to\_many :model" into both models (near the top of the models)

This process is reversible (with ``rails destroy htm model1 model2``).

## Potential Caveats

* Namespaced models should work (tested in form ``admin/post``). This will generate more verbose htm lines in the model, with explicit table names and key names
* Default: adds unique-constraint on index. I find this most useful for most situations. Just remove that from the generated migration before rake db:migrate.

