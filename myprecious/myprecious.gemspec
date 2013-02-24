$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "myprecious/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "myprecious"
  s.version     = Myprecious::VERSION
  s.authors     = ["Leonard Teo"]
  s.email       = ["leonard@ballistiq.com"]
  s.homepage    = "http://www.ballistiq.com"
  s.summary     = "This is a demo for Confoo"
  s.description = "This is a demo for Confoo"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"] + Dir["vendor/**/*"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "sqlite3"
end
