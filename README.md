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

Add this code to your Gemfile:
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

If you are user of [DRG CMS](https://www.drgcms.org) you don't need to do anything. Code
is included with drg_cms gem.

## Helpers

drg_material_fonts gem also provides some helpers (`mi_icon` and `mi_stacked_icon`) 
that will help you include icons into your code.

```ruby
mi_icon "photo_camera"
# => <i class="mi mi-photo_camera"></i>

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
# => <i class="mi-o mi-photo_camera"></i>

mi_icon "photo_camera-o", text: "Get started"
# => Get started <i class="mi-o mi-photo_camera">Get started</i>
```

There is also support for colored icons.
```ruby
mi_icon "photo_camera red"
# => <i class="mi mi-camera_retro mi-red"></i>
# other build in options are green,blue,violet
```

Adding your own CSS keywords is as simple as adding them to your CSS files.
```css
.mi-yellow {color: yellow}
```

and use them in your application.
```ruby
mi_icon "photo_camera yellow"
# => <i class="mi mi-camera_retro mi-yellow"></i>
```

## Compatibility with font-awesome-rails gem

drg_material_icons gem is a fork of [font-awesome-rails gem](https://github.com/bokmann/font-awesome-rails)
and is its 100% replacement. It includes fa_icon method as an alias to mi_icon method, 
which is just tad updated from original font-awesome-rails project. Therefore, you can mix
use of old and new variant of method call.
```ruby
mi_icon "photo_camera"
# => <i class="mi mi-photo_camera"></i>

# or

fa_icon "photo-camera"
# => <i class="mi mi-photo_camera"></i>
```

Some of Material icons names are the same as FontAwesome icons, but most are not and
you get blank space instead of icon image.
There are two solutions to this problem. You can find font icon replacement on 
https://fonts.google.com/icon and update icon name in your source code, or 
define CSS code for the icon name in your CSS files.
```css
.mi-times:before {content: '\e5cd'}
```

## License

* The Material design icons project is licensed under the [Apache License 2.0](
  https://github.com/google/material-design-icons/blob/master/LICENSE)
* The drg-material-icons project is licensed under the
  [MIT License](http://opensource.org/licenses/mit-license.html).
