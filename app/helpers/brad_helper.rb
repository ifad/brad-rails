module BradHelper
  def help_me_brad(key, opts = {})
    if (content = t(key, default: '')).present?
      help_button = opts.delete(:help_button)

      brad_button(key, opts) if help_button
      brad_contents(key, content)
    end
  end

  def brad_data_options(key, data_opts = {})
    brad_default_data_options.merge(data_opts).merge({target: "##{brad_contents_id(key)}"})
  end

  private

    def brad_contents_id(key)
      key.hash
    end

    def brad_default_data_options
      {
        placement: 'left',
        trigger:   'focus',
        toggle:    'brad-popover',
        template:  '<div class="brad popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
      }
    end

    def brad_button(key, opts)
      button_html = opts.delete(:button_html) || '<i class="fa fa-question-circle fa-lg text-info"></i>'

      haml_tag("a", {role: "button", href: "#", data: brad_data_options(key, opts.fetch(:data, {})), class: opts.fetch(:class, "help-trigger")}) do
        haml_concat button_html
      end
    end

    def brad_contents(key, content)
      haml_tag("div", {role: "brad-content", id: brad_contents_id(key), class: "brad-content hide"}) do
        haml_tag "div", content[:title_html], class: "title"
        haml_tag "div", content[:text_html].html_safe , class: "content"
      end
    end
end
