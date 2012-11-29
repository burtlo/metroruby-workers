# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "faster_xml_simple"
  s.version = "0.5.0"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Koziarski"]
  s.cert_chain = nil
  s.date = "2006-12-23"
  s.description = "A libxml based replacement for XmlSimple"
  s.email = "michael@koziarski.com"
  s.extra_rdoc_files = ["README", "COPYING"]
  s.files = ["README", "COPYING"]
  s.homepage = "http://fasterxs.rubyforge.org"
  s.rdoc_options = ["--title", "", "--main", "README", "--line-numbers", "--inline-source"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = "fasterxs"
  s.rubygems_version = "1.8.24"
  s.summary = "A libxml based replacement for XmlSimple"
  s.has_rdoc = true

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<libxml-ruby>, [">= 0.3.8.4"])
    else
      s.add_dependency(%q<libxml-ruby>, [">= 0.3.8.4"])
    end
  else
    s.add_dependency(%q<libxml-ruby>, [">= 0.3.8.4"])
  end
end
