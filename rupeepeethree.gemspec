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
  s.description = "tag your mp3 files. a command line wrapper around taglib-ruby."
  s.email = ["mcfiredrill@gmail.com"]
  s.executables = ["rp3"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage = "http://github.com/datafruits/rupeepeethree"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rupeepeethree"
  s.rubygems_version = "1.8.25"
  s.summary = "tag your mp3 files"

  s.add_dependency 'taglib-ruby', '~> 0.6.0'
  s.add_dependency 'trollop', '~> 2.0'
  s.add_dependency 'mime-types', '~> 2.0'

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
