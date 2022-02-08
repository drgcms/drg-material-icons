module DrgMaterialIcons
  module Rails
    module IconHelper
      # Creates an icon tag given an icon name and possible icon
      # modifiers.
      #
      # Examples
      #
      #   mi_icon "camera-retro"
      #   # => <i class="mi mi-camera-retro"></i>
      #
      #   mi_icon "camera-retro", text: "Take a photo"
      #   # => <i class="mi mi-camera-retro"></i> Take a photo
      #   mi_icon "chevron-right", text: "Get started", right: true
      #   # => Get started <i class="mi mi-chevron-right"></i>
      #
      #   mi_icon "camera-retro 2x"
      #   # => <i class="mi mi-camera-retro mi-2x"></i>
      #   mi_icon ["camera-retro", "4x"]
      #   # => <i class="mi mi-camera-retro mi-4x"></i>
      #   mi_icon "spinner spin lg"
      #   # => <i class="mi mi-spinner mi-spin mi-lg">
      #
      #   mi_icon "quote-left 4x", class: "pull-left"
      #   # => <i class="mi mi-quote-left mi-4x pull-left"></i>
      #
      #   mi_icon "user", data: { id: 123 }
      #   # => <i class="mi mi-user" data-id="123"></i>
      #
      #   content_tag(:li, mi_icon("check li", text: "Bulleted list item"))
      #   # => <li><i class="mi mi-check mi-li"></i> Bulleted list item</li>
      #
      #   If you want to use outline font style simply add -o to font name.
      def mi_icon(names = 'flag', original_options = {})
        options = original_options.deep_dup
        classes = ['mi']
        classes.concat Private.icon_names(names)
        classes.concat Array(options.delete(:class))
        text = options.delete(:text)
        right_icon = options.delete(:right)
        # outline icons end with -o suffix
        if classes[1].match(/\-o/)
          classes[0] = 'mi-o'
          classes[1].sub!('-o', '')
        end

        icon = content_tag(:i, nil, options.merge(class: classes))
        Private.icon_join(icon, text, right_icon)
      end
      alias fa_icon mi_icon

      # Creates an stack set of icon tags given a base icon name, a main icon
      # name, and possible icon modifiers.
      #
      # Examples
      #
      #   mi_stacked_icon "twitter", base: "square-o"
      #   # => <span class="mi-stack">
      #   # =>   <i class="mi mi-square-o mi-stack-2x"></i>
      #   # =>   <i class="mi mi-twitter mi-stack-1x"></i>
      #   # => </span>
      #
      #   mi_stacked_icon "terminal inverse", base: "square", class: "pull-right", text: "Hi!"
      #   # => <span class="mi-stack pull-right">
      #   # =>   <i class="mi mi-square mi-stack-2x"></i>
      #   # =>   <i class="mi mi-terminal mi-inverse mi-stack-1x"></i>
      #   # => </span> Hi!
      #
      #   mi_stacked_icon "camera", base: "ban-circle", reverse: true
      #   # => <span class="mi-stack">
      #   # =>   <i class="mi mi-camera mi-stack-1x"></i>
      #   # =>   <i class="mi mi-ban-circle mi-stack-2x"></i>
      #   # => </span>
      def mi_stacked_icon(names = 'flag', original_options = {})
        options = original_options.deep_dup
        classes = Private.icon_names('stack').concat(Array(options.delete(:class)))
        base_names = Private.array_value(options.delete(:base) || 'square-o').push('stack-2x')
        names = Private.array_value(names).push('stack-1x')
        base = mi_icon(base_names, options.delete(:base_options) || {})
        icon = mi_icon(names, options.delete(:icon_options) || {})
        icons = [base, icon]
        icons.reverse! if options.delete(:reverse)
        text = options.delete(:text)
        right_icon = options.delete(:right)
        stacked_icon = content_tag(:span, safe_join(icons), options.merge(class: classes))
        Private.icon_join(stacked_icon, text, right_icon)
      end
      alias fa_stacked_icon mi_stacked_icon

      module Private
        extend ActionView::Helpers::OutputSafetyHelper

        def self.icon_join(icon, text, reverse_order = false)
          return icon if text.blank?
          elements = [icon, ERB::Util.html_escape(text)]
          elements.reverse! if reverse_order
          safe_join(elements, ' ')
        end

        def self.icon_names(names = [])
          array_value(names).map { |n| "mi-#{n}" }
        end

        def self.array_value(value = [])
          value.is_a?(Array) ? value : value.to_s.split(/\s+/)
        end
      end
    end
  end
end
