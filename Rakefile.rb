require 'rubygems'
require 'bundler/setup'
require 'gemma'

Gemma::RakeTasks.with_gemspec_file 'omniauth-figshare.gemspec'

task :default => :test
