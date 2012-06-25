# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rafael Fidelis"]
  gem.email         = ["rafa_fidelis@yahoo.com.br"]
  gem.description   = %q{Simple Coderwall API Interface for Ruby}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/fidelisrafael/coderwall-ruby-api"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "coderwall-ruby-api"
  gem.require_paths = ["lib"]
  gem.version       = Coderwall::VERSION
end
