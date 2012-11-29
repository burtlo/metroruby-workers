# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "releasy"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bil Bas (Spooner)"]
  s.date = "2012-02-01"
  s.description = "Releasy helps to make Ruby application releases simpler, by creating and archiving source folders, Windows folders,\nstandalone executables, installers and OS X app bundles.\n"
  s.email = ["bil.bagpuss@gmail.com"]
  s.executables = ["releasy"]
  s.files = ["bin/releasy"]
  s.homepage = "http://spooner.github.com/libraries/releasy/"
  s.licenses = ["MIT", "GNU LGPL"]
  s.require_paths = ["lib"]
  s.requirements = ["7z (optional; used to generate archives)", "InnoSetup (optional on Windows; used to make Win32 installer)"]
  s.rubyforge_project = "releasy"
  s.rubygems_version = "1.8.24"
  s.summary = "Releasy helps to make Ruby application releases simpler"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ocra>, ["~> 1.3.0"])
      s.add_runtime_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_runtime_dependency(%q<cri>, ["~> 2.1.0"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_runtime_dependency(%q<net-github-upload>, ["~> 0.0.8"])
      s.add_development_dependency(%q<riot>, ["~> 0.12.5"])
      s.add_development_dependency(%q<rr>, ["~> 1.0.4"])
      s.add_development_dependency(%q<yard>, ["~> 0.7.4"])
      s.add_development_dependency(%q<redcarpet>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<ocra>, ["~> 1.3.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
      s.add_dependency(%q<cri>, ["~> 2.1.0"])
      s.add_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_dependency(%q<net-github-upload>, ["~> 0.0.8"])
      s.add_dependency(%q<riot>, ["~> 0.12.5"])
      s.add_dependency(%q<rr>, ["~> 1.0.4"])
      s.add_dependency(%q<yard>, ["~> 0.7.4"])
      s.add_dependency(%q<redcarpet>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<ocra>, ["~> 1.3.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2.2"])
    s.add_dependency(%q<cri>, ["~> 2.1.0"])
    s.add_dependency(%q<thor>, ["~> 0.14.6"])
    s.add_dependency(%q<net-github-upload>, ["~> 0.0.8"])
    s.add_dependency(%q<riot>, ["~> 0.12.5"])
    s.add_dependency(%q<rr>, ["~> 1.0.4"])
    s.add_dependency(%q<yard>, ["~> 0.7.4"])
    s.add_dependency(%q<redcarpet>, ["~> 2.0.1"])
  end
end
