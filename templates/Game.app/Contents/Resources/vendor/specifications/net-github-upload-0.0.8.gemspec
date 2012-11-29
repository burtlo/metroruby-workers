# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "net-github-upload"
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Constellation"]
  s.date = "2012-01-28"
  s.description = "Ruby Net::GitHub::Upload is upload user agent for GitHub Downloads\n"
  s.email = "utatane.tea@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/Constellation/ruby-net-github-upload"
  s.rdoc_options = ["--main", "README.rdoc", "--charset", "utf-8", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "ruby-net-github-upload"
  s.rubygems_version = "1.8.24"
  s.summary = "ruby porting of Net::GitHub::Upload"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.0"])
      s.add_runtime_dependency(%q<faster_xml_simple>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<httpclient>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.0"])
      s.add_dependency(%q<faster_xml_simple>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<httpclient>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.0"])
    s.add_dependency(%q<faster_xml_simple>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<httpclient>, [">= 0"])
  end
end
