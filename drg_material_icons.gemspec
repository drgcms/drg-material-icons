require File.expand_path('../lib/drg_material_icons/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Damjan Rems']
  gem.email         = ['damjan.rems@gmail.com']
  gem.description   = 'drg_material_icons provides Google Material icon web fonts and stylesheets as a Rails engine for use with the asset pipeline.'
  gem.summary       = 'an asset gemification of the Google Material icon font library'
  gem.homepage      = 'https://github.com/drgcms/drg-material-icons'
  gem.licenses      = ['MIT', 'SIL Open Font License']

  gem.files         = `git ls-files -- {app,bin,lib,test,spec}/* {LICENSE*,Rakefile,README*}`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec}/*`.split("\n")
  gem.name          = 'drg_material_icons'
  gem.require_paths = ['lib']
  gem.version       = DrgMaterialIcons::Rails::VERSION

  gem.add_dependency 'railties', '>= 3.2', '< 8.0'

  gem.add_development_dependency 'activesupport'
  gem.add_development_dependency 'sassc-rails'

  gem.required_ruby_version = '>= 2'
end
