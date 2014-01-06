# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filter_params/version'

Gem::Specification.new do |spec|
  spec.name          = "filter_params"
  spec.version       = FilterParams::VERSION
  spec.authors       = ["sumakumardey"]
  spec.email         = ["bappi.5476@gmail.com"]
  spec.description   = %q{This gem is for cleanning the controller params}
  spec.summary       = %q{both whitelist and blacklist approach is implemented for removing the params from mass assignment}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake","0.8.7"
  spec.add_development_dependency "rspec","1.3.1"
  spec.add_development_dependency "rails", "2.3.18"
  spec.add_development_dependency "rr", '1.0.4'
  spec.add_development_dependency 'rspec-rails',"1.3.3"
  spec.required_rubygems_version = ">= 1.3.4"
end
