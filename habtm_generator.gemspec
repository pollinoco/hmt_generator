# frozen_string_literal: true

require "English"
Gem::Specification.new do |gem|
  gem.authors       = [ "Stefan Wienert" ]
  gem.email         = [ "stefan.wienert@pludoni.de" ]
  gem.description   = %q(Generates has-and-belongs-to-many migrations. Use rails generate habtm model1 model2)
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/zealot128/ruby-habtm-generator"

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "habtm_generator"
  gem.require_paths = [ "lib" ]
  gem.version       = "1.7"
  gem.add_dependency "activerecord"
  gem.add_development_dependency "appraisal"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rails-dummy"
end
