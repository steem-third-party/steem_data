# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steem_data/version'

Gem::Specification.new do |spec|
  spec.name = 'steemdata-rb'
  spec.version = SteemData::VERSION
  spec.authors = ['Anthony Martin']
  spec.email = ['steemdata-rb@martin-studio.com']

  spec.summary = %q{SteemData Ruby}
  spec.description = %q{Wrapper for accessing steemdata.com in a ruby application.}
  spec.homepage = 'https://github.com/inertia186/steemdata-rb'
  spec.license = 'CC0 1.0'

  # spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 11.2.2'
  spec.add_development_dependency 'minitest', '~> 5.9.0'
  spec.add_development_dependency 'minitest-line', '~> 0.6.3'
  spec.add_development_dependency 'simplecov', '~> 0.11.2'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.5.2'
  spec.add_development_dependency 'yard', '~> 0.8.7.6'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'awesome_print', '~> 1.7.0'

  spec.add_dependency('mongoid')
end
