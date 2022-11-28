ActionView::Base.field_error_proc = proc do |html_tag, instance|
    html_doc = Nokogiri::HTML::DocumentFragment.parse(html_tag, Encoding::UTF_8.to_s)
    debugger
    element = html_doc.children[0]

    if element
      debugger
        # element.add_class('is-invalid')
        element.parent.add_class('has-danger')

        if %w[input select textarea].include? element.name
            instance.raw %(#{html_doc.to_html} <span class="error">#{[*instance.error_message].to_sentence}</span>)
        else
            instance.raw html_doc.to_html
        end
    else
        html_tag
    end
end
