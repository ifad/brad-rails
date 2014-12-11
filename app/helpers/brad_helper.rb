module BradHelper

  DEFAULT_OPTIONS = {
    placement: 'left',
    trigger:   'focus',
    toggle:    'brad-popover',
    template:  '<div class="brad popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
  }

  def help_me_brad(key, opts = {})
    if (content = t(key, default: '')).present?
      button(key, opts) if opts.delete(:help_button).present?
      contents(key, content)
    end
  end

  def brad_data_options(key, data_opts = {})
    DEFAULT_OPTIONS.merge(data_opts).merge({target: "##{id_for(key)}"})
  end

  private

    def id_for(key)
      key.hash
    end

    def button(key, opts)
      haml_tag("a", {role: "button", href: "#", data: brad_data_options(key, opts.fetch(:data, {})), class: opts.fetch(:class, "help-trigger")}) do
        if b = opts.delete(:button_html).presence
          haml_concat button_html
        else
          haml_tag :i, '', class: 'fa fa-question-circle fa-lg text-info'
        end
      end
    end

    def contents(key, content)
      haml_tag("div", {role: "brad-content", id: id_for(key), class: "brad-content hide"}) do
        haml_tag "div", content[:title_html], class: "title"
        haml_tag "div", content[:text_html].html_safe , class: "content"
      end
    end
end
