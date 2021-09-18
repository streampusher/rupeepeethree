# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rupeepeethree/version'

Gem::Specification.new do |s|
  s.name = "rupeepeethree"
  s.version = Rupeepeethree::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tony Miller"]
  s.date = "2013-03-14"
  s.description = "tag your mp3 files. a command line wrapper and library around taglib-ruby."
  s.email = ["mcfiredrill@gmail.com"]
  s.bindir = 'bin'
  s.executables = ["rp3"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage = "http://github.com/datafruits/rupeepeethree"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "tag your mp3 files"

  s.add_dependency 'taglib-ruby', '~> 0.7.0'
  s.add_dependency 'optimist'
  s.add_dependency 'mime-types', '>= 1.16'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "fruity_formatter"
  s.add_development_dependency "terrapin"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.5"])
    else
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.5"])
  end
end
