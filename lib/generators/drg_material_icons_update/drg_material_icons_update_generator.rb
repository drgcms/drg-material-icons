class DrgMaterialIconsUpdateGenerator < Rails::Generators::NamedBase
  
source_root File.expand_path('../templates', __FILE__)
desc "This generator creates CSS files for supporting Google material icons"
#argument :form_name, :type => :string, :default => ''
#class_option :tabs, :type => :boolean, :default => false, :description => "Create form with tabulators" 

###########################################################################
# Will create output and save it to form filename.
###########################################################################
def create_css_file
  @cp_dir = File.dirname(__FILE__)
  @css_dir = File.expand_path('../../../../app/assets/stylesheets', __FILE__)
  pp @cp_dir, @css_dir
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
    if icons[name].nil?
      pp [name, code]
      icons[name] = code
    end
  end
  icons.inject('') { |r, icon| r << %(.mi-#{icon.first}:before {content: '\\#{icon.last}';}\n) }
end

end
