$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tolk_engine/version"
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = 'tolk_engine'
  s.version       = TolkEngine::VERSION
  s.summary       = %q{You'll find an admin managing section, an translation summary section and an in-line translation webpage}
  s.description   = %q{An amazing app which provide you the ability to internationalize your main app}

  s.authors       = "Vince"
  s.email         = "vincent.alex.huet@gmail.com"
  s.description   = %q{An amazing app which provide you the ability to internationalize your main app}

  s.homepage      = 'http://github.com/VincentHuet/s_tolk_djengo'
  s.platform      = Gem::Platform::RUBY

  s.add_dependency('rails', '~> 3.2.0')
  s.add_dependency('will_paginate')
  s.add_dependency('ya2yaml', '~> 0.26')
  s.add_dependency("jquery-rails")
  s.add_dependency('sass-rails', '~> 3.2.3')
  s.add_dependency('coffee-rails', '~> 3.2.1')
  s.add_dependency('twitter-bootstrap-rails')
  s.add_dependency('less-rails-bootstrap')
  s.add_dependency('less-rails-fontawesome')
  s.add_dependency('uglifier', '>= 1.0.3')
  s.add_dependency('jquery-rails')
  s.add_dependency('devise')
  s.add_dependency('cancan')
  s.add_dependency('haml')
  s.add_dependency('ya2yaml')
  s.add_dependency("carrierwave")
  s.add_dependency('i18n')
  s.add_dependency('hpricot')
  s.add_dependency('ruby_parser')

  s.add_development_dependency "sqlite3"

  s.files         = Dir['README', 'MIT-LICENSE', 'config/routes.rb', 'init.rb', 'lib/**/*', 'app/**/*', 'public/tolk_engine/**/*']

  s.require_path  = 'lib'

  s.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact


end
