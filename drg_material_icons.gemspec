require File.expand_path('../lib/drg_material_icons/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Damjan Rems']
  gem.email         = ['damjan.rems@gmail.com']
  gem.description   = 'drg_material_icons provides Google Material icon web fonts and stylesheets as a Rails engine for use with the asset pipeline.'
  gem.summary       = 'an asset gemification of the Google Material icon font library'
  gem.homepage      = 'https://github.com/drgcms/drg-material-icons'
  gem.licenses      = ['MIT']

  gem.files         = Dir["{app,lib}/**/*"] + %w[LICENSE Rakefile README.md]
  gem.test_files    = Dir["test/**/*"]

  gem.name          = 'drg_material_icons'
  gem.require_paths = ['lib']
  gem.version       = DrgMaterialIcons::Rails::VERSION

  gem.add_dependency 'railties'#, '>= 3.2', '< 8.0'

  gem.add_development_dependency 'activesupport'

  gem.required_ruby_version = '>= 2'
end
