$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tolk_engine/version"
# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tolk_engine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'tolk_djengo'
  gem.version       = TolkEngine::VERSION
  gem.summary       = %q{You'll find an admin managing section, an translation summary section and an in-line translation webpage}
  gem.description   = %q{An amazing app which provide you the ability to internationalize your main app}

  gem.authors       = "Vince"
  gem.email         = "vincent.alex.huet@gmail.com"
  gem.description   = %q{An amazing app which provide you the ability to internationalize your main app}

  gem.homepage      = 'http://github.com/VincentHuet/gem_tolk_djengo'
  gem.platform      = Gem::Platform::RUBY

  gem.add_dependency('rails', '3.2.7')
  gem.add_dependency('will_paginate')
  gem.add_dependency('ya2yaml', '~> 0.26')
  gem.add_dependency "jquery-rails")
  gem.add_dependency('sass-rails', '~> 3.2.3')
  gem.add_dependency('coffee-rails', '~> 3.2.1')
  gem.add_dependency('twitter-bootstrap-rails')
  gem.add_dependency('less-rails-bootstrap')
  gem.add_dependency('less-rails-fontawesome')
  gem.add_dependency('therubyracer', :platforms => :ruby, :require => 'v8')
  gem.add_dependency('uglifier', '>= 1.0.3')
  gem.add_dependency('jquery-rails')
  gem.add_dependency('devise')
  gem.add_dependency('cancan')
  gem.add_dependency('haml')
  gem.add_dependency('ya2yaml')
  gem.add_dependency("carrierwave")
  gem.add_dependency('i18n')
  gem.add_dependency('hpricot')
  gem.add_dependency('ruby_parser')

  gem.add_development_dependency "sqlite3"

  gem.files         = Dir['README', 'MIT-LICENSE', 'config/routes.rb', 'init.rb', 'lib/**/*', 'app/**/*', 'public/tolk_engine/**/*']

  gem.require_path  = 'lib'

  gem.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact


end
