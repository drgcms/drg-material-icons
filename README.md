# drg-material-icons

[![Gem Version](http://img.shields.io/gem/v/drg_material_icons.svg)](https://rubygems.org/gems/drg_material_icons)
[![Gem Downloads](https://img.shields.io/gem/dt/drg_material_icons.svg)](https://rubygems.org/gems/drg_material_icons)

drg_material_icons provides the
[Material-icons](https://fonts.google.com/icons) web fonts and
stylesheets as a Rails engine for use with the asset pipeline.<br>

drg_material_icons gem also provides compatibility with the old font-awesome-rails gem.
If you are still using old Font awesome v4.7 icons and want to upgrade to
more rich Google material icons you simply replace font-awesome-rails gem 
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

You also get some helpers (`mi_icon` and `mi_stacked_icon`) that make your
views look great with new icons.

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
To get outline type of icons simply add -o suffix to icon name.  
```ruby
mi_icon "photo_camera-o"
# => <i class="mi-o mi-camera-retro"></i>

mi_icon "chevron_right-o", text: "Get started", right: true
# => Get started <i class="mi-o mi-chevron_right mi-poll-right">Get started</i>
```

## Compatibility with font-awesome-rails gem

drg_material_icons gem is a fork of font-awesome-rails 
gem https://github.com/bokmann/font-awesome-rails and is
its 100% replacement. It includes fa_icon method as an alias to mi_icon method, which is just
renamed from original font-awesome-rails project. Therefore, you can mix
use of old and new variant of method call.
```ruby
mi_icon "photo_camera"
# => <i class="mi mi-camera"></i>

# or

fa_icon "photo-camera"
# => <i class="mi mi-camera"></i>
```

There are examples where FontAwesome icons names are different as
Material icons names. You have two solutions to this problem. You can 
find font icon replacement on https://fonts.google.com/icon and update icon name in
your source code or, define content code for the icon name in your application 
CSS file.
```css
.mi-times:before {content: '\e5cd'}
```

## License

* The Material design icons project is licensed under the [Apache License 2.0](
  https://github.com/google/material-design-icons/blob/master/LICENSE)
* The drg-material-icons project is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
