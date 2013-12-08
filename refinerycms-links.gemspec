# Encoding: UTF-8
require File.expand_path('../lib/refinery/links/version', __FILE__)

version = Refinery::Links::Version.to_s

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-links}
  s.version           = version
  s.summary           = %q{Links extension for Refinery CMS}
  s.description       = %q{This extension handles links to user generated content.}
  s.email             = %q{nospam.keram@gmail.com}
  s.homepage          = %q{http://refinery.sk}
  s.authors           = ['Marek Labos']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency 'refinerycms-core',            '~> 2.718.0.dev'
end
