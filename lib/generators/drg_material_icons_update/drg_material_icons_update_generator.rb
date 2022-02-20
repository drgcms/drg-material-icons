class DrgMaterialIconsUpdateGenerator < Rails::Generators::Base
  
source_root File.expand_path('../templates', __FILE__)
desc "This generator creates app/assets/stylesheets/drg_material_icons.css"

###########################################################################
# Will create output and save it to form filename.
###########################################################################
def create_css_file
  @cp_dir = File.dirname(__FILE__)
  @css_dir = File.expand_path('../../../../app/assets/stylesheets', __FILE__)
  css = common_css + build_css
  create_file "#{@css_dir}/drg_material_icons.css", css
end

private
###########################################################################
#
###########################################################################
def common_css
  File.read("#{@cp_dir}/common.css")
end

###########################################################################
#
###########################################################################
def build_css
  icons = {}
  File.readlines("#{@cp_dir}/material-icons-outline.codepoints").each do |line|
    name, code = line.chomp.split(' ')
    icons[name] = code
  end

  File.readlines("#{@cp_dir}/material-icons-regular.codepoints").each do |line|
    name, code = line.chomp.split(' ')
    icons[name] = code if icons[name].nil?
  end
  icons.inject('') { |r, icon| r << %(.mi-#{icon.first}:before {content: '\\#{icon.last}';}\n) }
end

end
