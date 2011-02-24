# -*- ruby -*-
require "rubygems"
require "rake"

GEMSPEC = Gem::Specification.new do |s|
  s.name = "ruby-dbus-openplacos"
  # s.rubyforge_project = nil
  s.summary = "Fork from ruby-dbus"
  # s.description = FIXME
  s.version = File.read("VERSION").strip
  s.author = "Openplacos Team"
  s.homepage = "https://github.com/flagos/ruby-dbus"
  s.files = FileList["{doc/tutorial,examples,lib,test}/**/*", "Rakefile", "ruby-dbus-openplacos.gemspec", "VERSION"].to_a.sort
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["COPYING", "README", "NEWS"]
  s.required_ruby_version = ">= 1.8.7"
end
