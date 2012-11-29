# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ocra"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lars Christensen"]
  s.date = "2011-06-19"
  s.description = "OCRA (One-Click Ruby Application) builds Windows executables from Ruby\r\nsource code. The executable is a self-extracting, self-running\r\nexecutable that contains the Ruby interpreter, your source code and\r\nany additionally needed ruby libraries or DLL."
  s.email = "larsch@belunktum.dk"
  s.executables = ["ocra"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["bin/ocra", "History.txt", "Manifest.txt", "README.rdoc"]
  s.homepage = "http://ocra.rubyforge.org/"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "ocra"
  s.rubygems_version = "1.8.24"
  s.summary = "OCRA (One-Click Ruby Application) builds Windows executables from Ruby\r source code"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.9.4"])
    else
      s.add_dependency(%q<hoe>, [">= 2.9.4"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.9.4"])
  end
end
