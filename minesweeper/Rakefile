#!/usr/bin/ruby
require 'rubygems'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format progress"
  t.rcov = true
  t.rcov_opts = ["-o coverage/ --exclude 'gems/*' -p --text-summary"]
end

task :default => :features do
  system("flog #{File.dirname(__FILE__)}/lib/game.rb")
end