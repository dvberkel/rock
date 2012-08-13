#!/usr/bin/env rake

require "rubygems"
require "bundler/setup"

require 'rspec/core/rake_task'

task :default => [:test]

desc "Run all test tasks"
task :test => [:rspec] do
  puts "Testing stage finished."
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |t|
  t.rspec_opts = ['-I lib', '-I lib/rock']
  t.pattern = 'spec/**/*_spec.rb'
end