# frozen_string_literal: true

require "rails/generators/migration"
require "rails/generators/active_record"
class HtmGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path("templates", __dir__)
  argument :other_model, required: true,
                         type: :string, desc: "List both part of the hmt migration to generate the table"

  def create_migration_file
    models.map!(&:singularize)
    migration_template "htm_migration.rb.erb",
                       "db/migrate/#{migration_name}.rb"

    add_migration_line model: models[0],  other: models[1]
    add_migration_line model: models[1],  other: models[0]
  end

  def create_model_file
    template "htm_model.rb", File.join("app/models", "#{model_filename}.rb")
  end

  private

  def add_migration_line(hash)
    other = hash[:other]
    model = hash[:model]
    inject_into_class "app/models/#{model}.rb", model.camelcase,
                      "  has_many :#{no_ns table_name}\n  has_many :#{no_ns other.pluralize}, through: :#{no_ns table_name}\n"
  end

  def no_ns(m)
    m.tr("/", "_")
  end

  def join_table(model); end

  def coding_convention
    options[:convention].to_s
  end

  def table_name
    pluralized = sorted_models.map { |i| no_ns i.tableize }
    pluralized.join("\0").gsub(/^(.*[._])(.+)\0\1(.+)/, '\1\2_\3').tr("\0", "_")
  end

  def models
    [ name, other_model ]
  end

  def sorted_models
    ret = models.map(&:singularize).map(&:underscore)
    ret.sort
  end

  def references
    sorted_models.map { |i| ":#{no_ns i.singularize}" }
  end

  def id_columns
    sorted_models.map { |i| ":#{no_ns i.foreign_key}" }.join(", ")
  end

  def model_name
    sorted_models.map.with_index do |model, index|
      if index == 0
        model.camelize.pluralize
      else
        model.camelize
      end
    end.join("")
  end

  def model_filename
    sorted_models.map.with_index do |model, index|
      if index == 0
        model.downcase.pluralize
      else
        model.downcase
      end
    end.join("_")
  end

  def model_relationships
    sorted_models.map { |i| ":#{no_ns i.singularize}" }
  end

  def migration_name
    "create_#{table_name}"
  end

  def migration_class_name
    migration_name.camelize
  end
end
