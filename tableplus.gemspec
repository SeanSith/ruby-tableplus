# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/tableplus/version'

Gem::Specification.new do |spec|
  spec.name          = 'tableplus'
  spec.version       = TablePlus::VERSION
  spec.authors       = ['Sean Smith']
  spec.email         = ['sean@seansith.com']
  spec.description   = 'TablePlus Connection/ConnectionGroup Interaction Library'
  spec.summary       = 'TablePlus Connection/ConnectionGroup Interaction Library'
  spec.homepage      = 'https://github.com/SeanSith/tableplus-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2'

  spec.require_paths = ['lib']

  spec.add_dependency 'plist', '~> 3.7.0'
end
