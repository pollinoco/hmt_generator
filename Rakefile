#!/usr/bin/env rake
# frozen_string_literal: true

require "bundler/gem_tasks"
require "rails/dummy/tasks"

module Rails
  module Dummy
    class Generator
      def original_name
        "htm_generator"
      end
    end
  end
end

task clear: :environment do
  rm_rf "spec/dummy"
end
task test: [ :clear, "dummy:app" ] do
  system "rails g model user"
  system "rails g model post"
  system "rails g model admin/process"
  system "rails g htm user post"
  system "rails g htm user admin/process"

  system "rails g model chef_process"
  system "rails g model chef_script"
  system "rails g htm chef_process chef_script"
  system "rake db:migrate"
  system "pwd"
  system "rails r ../../test.rb"
end
