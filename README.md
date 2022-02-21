# drg-material-icons

[![Gem Version](http://img.shields.io/gem/v/drg_cms.svg)](https://rubygems.org/gems/drg_cms)
[![Gem Downloads](https://img.shields.io/gem/dt/font-awesome-rails.svg)](https://rubygems.org/gems/drg_cms)

drg_material_icons provides the
[Material-icons](https://fonts.google.com/icons) web fonts and
stylesheets as a Rails engine for use with the asset pipeline.<br>

drg_material_icons gem also provides compatibility with the font-awesome-rails gem.
If you are still using old Font awesome v4.7 icons and want to upgrade
more rich Google material icons you simply replace font-awesome gem 
with drg_material_icons gem.


## Installation

Add this to your Gemfile:

```ruby
gem "drg_material_fonts"
```

and run `bundle install`.

## Usage

In your `application.css`, include the css file:

```css
/*
 *= require drg_material_fonts
 */
```
Then restart your webserver if it was previously running.

Congrats! You now have scalable vector icon support. Pick an icon and check out the
[FontAwesome Examples](http://fortawesome.github.io/Font-Awesome/examples/).

### Sass Support

If you prefer [SCSS](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), add this to your
`application.css.scss` file:

```scss
@import "drg_material_icons";
```

If you use the
[Sass indented syntax](http://sass-lang.com/docs/yardoc/file.INDENTED_SYNTAX.html),
add this to your `application.css.sass` file:

```sass
@import drg_material_icons
```

### Helpers

There are also some helpers (`mi_icon` and `mi_stacked_icon`) that make your
views _icontastic!_

```ruby
mi_icon "photo_camera"
# => <i class="mi mi-camera_retro"></i>

mi_icon "photo_camera", text: "Take a photo"
# => <i class="mi mi-photo_camera"></i> Take a photo

mi_icon "chevron_right", text: "Get started", right: true
# => Get started <i class="mi mi-chevron_right mi-poll-right"></i>

content_tag(:li, mi_icon("check li", text: "Bulleted list item"))
# => <li><i class="mi mi-check mi-li"></i> Bulleted list item</li>
```

drg_material_icons includes two material icon font types. Regular and outline.
To get outline type of icon simply add -o suffix to icon name.  
```ruby
mi_icon "photo_camera-o"
# => <i class="mi-o mi-camera-retro"></i>

mi_icon "chevron_right-o", text: "Get started", right: true
# => Get started <i class="mi-o mi-chevron_right mi-poll-right"></i>
``

### Rails engines

When building a Rails engine that includes drg_material_icons as a dependency,
be sure to `require "drg_material_icons"` somewhere during the initialization of
your engine. Otherwise, Rails will not automatically pick up the load path of
the drg_material_icons assets and helpers.

## Compatibility with font-awesome-rails gem

drg_material_icons gem is a fork of font-awesome-rails gem https://github.com/bokmann/font-awesome-rails and is 
its 100% replacement. It includes fa_icon method as an alias to mi_icon method which is just
renamed from original font-awesome-rails project. Therefore you can 
use old or new version of method call.
```ruby
mi_icon "photo_camera"
# or
fa_icon "photo-camera"
```

There are examples where Font awesome icons names are different as
Material icons names. There are two solutions to this problem. You can 
find font icon replacement here https://fonts.google.com/icon and update
your source files or define replacement for the icon name in your application 
css file.
```css

```

## License

* The [Font Awesome](http://fortawesome.github.io/Font-Awesome) font is
  licensed under the [SIL Open Font License](http://scripts.sil.org/OFL).
* [Font Awesome](http://fortawesome.github.io/Font-Awesome) CSS files are
  licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
* The remainder of the font-awesome-rails project is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
