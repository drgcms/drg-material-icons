#!/bin/bash
rm drg_material_icons*.gem
gem build drg_material_icons.gemspec
gem inabox drg_mat*.gem -o -g http://gems.ozs.si
rm drg_material_icons*.gem

