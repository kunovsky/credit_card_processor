# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_processor/version'

Gem::Specification.new do |spec|
  spec.name          = "credit_card_processor"
  spec.version       = CreditCardProcessor::VERSION
  spec.authors       = ["Tyson Kunovsky"]
  spec.email         = ["tkunovsky@gmail.com"]
  spec.description   = spec.summary = %q{Credit Card Processing Made Easy.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['credit_card_processor', 'process_credit_card_file']
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~>3.2"
  spec.add_development_dependency "pry"
end
