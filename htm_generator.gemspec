# frozen_string_literal: true

require "English"
Gem::Specification.new do |gem|
  gem.authors       = [ "Stefan Wienert" ]
  gem.email         = [ "stefan.wienert@pludoni.de" ]
  gem.description   = %q(Generates has-many-through migrations. Use rails generate htm model1 model2)
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/zealot128/ruby-htm-generator"

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "htm_generator"
  gem.require_paths = [ "lib" ]
  gem.version       = "2.4"
  gem.add_dependency "activerecord"
  gem.add_development_dependency "appraisal"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rails-dummy"
end
