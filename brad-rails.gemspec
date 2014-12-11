# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brad/version'

Gem::Specification.new do |spec|
  spec.name          = "brad-rails"
  spec.version       = Brad::VERSION
  spec.authors     = ["Stefano Guglielmetti"]
  spec.email       = ["s.guglielmetti@ifad.org"]
  spec.summary     = %q{I'd rather sink than call Brad for help!}
  spec.description = "Brad is a simple tool for generating help popovers based on Boostrap 3 Popovers"
  spec.homepage    = "https://github.com/ifad/brad-rails"
  spec.license     = "MIT"

  spec.files = Dir["{lib,vendor,app}/**/*"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'bundler', '~> 1.7'

  spec.add_dependency             'railties'

  spec.add_runtime_dependency     'haml',     ['>= 3.1', '< 5.0']
  spec.add_runtime_dependency     'i18n'
  spec.add_runtime_dependency     'less-rails'
end
