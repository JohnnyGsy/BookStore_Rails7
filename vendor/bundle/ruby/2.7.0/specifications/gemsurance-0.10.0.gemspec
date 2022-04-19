# -*- encoding: utf-8 -*-
# stub: gemsurance 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gemsurance".freeze
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.11".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jon Kessler".freeze]
  s.date = "2019-09-26"
  s.description = "Gem vulnerability and version checker".freeze
  s.email = "jon.kessler@appfolio.com".freeze
  s.executables = ["gemsurance".freeze]
  s.files = ["bin/gemsurance".freeze]
  s.homepage = "http://github.com/appfolio/gemsurance".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Your Gem Insurance Policy".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<bundler>.freeze, [">= 1.2", "< 3.0"])
    s.add_runtime_dependency(%q<git>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<gems>.freeze, [">= 0.8"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.2", "< 3.0"])
    s.add_dependency(%q<git>.freeze, ["~> 1.2"])
    s.add_dependency(%q<gems>.freeze, [">= 0.8"])
  end
end
