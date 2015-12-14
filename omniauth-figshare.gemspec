# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'omniauth-figshare/version'

Gem::Specification.new do |s|
  s.name              = 'omniauth-figshare'
  s.version           = OmniAuth::Figshare::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ['John Lees-Miller']
  s.homepage          = 'https://github.com/jdleesmiller/omniauth-figshare'
  s.summary           = %q{An OmniAuth strategy for the figshare API.}
  s.description       = %q{An OmniAuth Strategy for the figshare API. You can use it to authenticate users against the figshare API in your ruby on rails / sinatra / other rack-based web application.}

  s.rubyforge_project = 'omniauth-figshare'

  s.add_runtime_dependency 'omniauth-oauth'
  s.add_runtime_dependency 'multi_json'
  s.add_development_dependency 'gemma'

  s.files       = Dir.glob('{lib,bin}/**/*.rb') + %w(README.rdoc)
  s.test_files  = Dir.glob('test/omniauth-figshare/*_test.rb')

  s.rdoc_options = [
    "--main",    "README.rdoc",
    "--title",   "#{s.full_name} Documentation"]
  s.extra_rdoc_files << "README.rdoc"
end

