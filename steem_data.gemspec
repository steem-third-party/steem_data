# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steem_data/version'

Gem::Specification.new do |spec|
  spec.name = 'steem_data'
  spec.version = SteemData::VERSION
  spec.authors = ['Anthony Martin']
  spec.email = ['steemdata@martin-studio.com']

  spec.summary = %q{SteemData Ruby}
  spec.description = %q{Wrapper for accessing steemdata.com in a ruby application.}
  spec.homepage = 'https://github.com/steem-third-party/steem_data'
  spec.license = 'CC0 1.0'

  # spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15', '>= 1.15.4'
  spec.add_development_dependency 'rake', '~> 12.1', '>= 12.1.0'
  spec.add_development_dependency 'minitest', '~> 5.10', '>= 5.10.3'
  spec.add_development_dependency 'minitest-line', '~> 0.6', '>= 0.6.4'
  spec.add_development_dependency 'simplecov', '~> 0.15', '>= 0.15.1'
  spec.add_development_dependency 'yard', '~> 0.9', '>= 0.9.9'
  spec.add_development_dependency 'pry', '~> 0.11', '>= 0.11.1'
  spec.add_development_dependency 'awesome_print', '~> 1.8', '>= 1.8.0'

  spec.add_dependency 'mongoid', '~> 6.1', '>= 6.1.0'
end
