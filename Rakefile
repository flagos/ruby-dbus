#! /usr/bin/env ruby
require 'rake'
require 'rake/gempackagetask'
require 'fileutils'
include FileUtils
require 'tmpdir'
require 'rake/rdoctask'
require 'rake/testtask'

desc 'Default: run tests in the proper environment'
task :default => :test

def common_test_task(t)
    t.libs << "lib"
    t.test_files = FileList['test/*_test.rb', 'test/t[0-9]*.rb']
    t.verbose = true
end
Rake::TestTask.new("bare:test") {|t| common_test_task t }

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new("bare:rcov") {|t| common_test_task t }
rescue LoadError
  # no rcov, never mind
end

%w(test rcov).each do |tname|
  desc "Run bare:#{tname} in the proper environment"
  task tname do |t|
    cd "test" do
      system "./test_env rake bare:#{tname}"
    end
  end
end

load "ruby-dbus-openplacos.gemspec"

Rake::GemPackageTask.new(GEMSPEC) do |pkg|
  # no other formats needed
end

desc "Build a package from a clone of the local Git repo"
task :package_git do |t|
  Dir.mktmpdir do |temp|
    sh "git clone . #{temp}"
    cd temp do
      sh "rake package"
    end
    cp_r "#{temp}/pkg", "."
  end
end

Rake::RDocTask.new do |rd|
  rd.rdoc_dir = 'doc/rdoc'
  rd.rdoc_files.include("README", "lib/**/*.rb")
#  rd.options << "--diagram"
#  rd.options << "--all"
end

desc "Render the tutorial in HTML"
task :tutorial => "doc/tutorial/index.html"
file "doc/tutorial/index.html" => "doc/tutorial/index.markdown" do |t|
  sh "markdown #{t.prerequisites[0]} > #{t.name}"
end
