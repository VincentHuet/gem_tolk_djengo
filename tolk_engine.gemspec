# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tolk_engine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vince"]
  gem.email         = ["vincent.alex.huet@gmail.com"]
  gem.description   = %q{An amazing app which provide you the ability to internationalize your main app}
  gem.summary       = %q{You'll find an admin managing section, an translation summary section and an in-line translation webpage}
  gem.homepage      = ""

  gem.add_dependency 'rails', '3.2.7'

  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  gem.require_path = 'lib'
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tolk_engine"
  gem.version       = TolkEngine::VERSION
end
