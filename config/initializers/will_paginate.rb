# frozen_string_literal: true

# config/initializers/will_paginate.rb
#
# This extension code was written by Isaac Bowen, originally found
# at http://isaacbowen.com/blog/using-will_paginate-action_view-and-bootstrap/

require 'will_paginate/view_helpers/action_view'

module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      if collection.is_a? Hash
        options = collection
        collection = nil
      end
      # Taken from original will_paginate code to handle if the helper is not passed a collection object.
      collection ||= infer_collection_from_controller
      options[:renderer] ||= BootstrapLinkRenderer
      super.try :html_safe
    end

    class Bootstrap4LinkRenderer < LinkRenderer
      protected

      def html_container(html)
        tag :nav, tag(:ul, html, class: ul_class), class: 'pagination'
      end

      def page_number(page)
        item_class = if page == current_page
                       'active page-item'
                     else
                       'page-item'
                     end

        tag :li, link(page, page, rel: rel_value(page), class: 'page-link'), class: item_class
      end

      def gap
        tag :li, link('&hellip;'.html_safe, '#', class: 'page-link'), class: 'page-item disabled'
      end

      def previous_or_next_page(page, text, classname)
        text = '<' if classname == 'previous_page'
        text = '>' if classname == 'next_page'
        link_obj = link(text, page || '#', class: 'page-link')
        classes = [(classname[0..3] if @options[:page_links]), (classname if @options[:page_links]),
                   ('disabled' unless page), 'page-item'].join(' ')
        tag :li, link_obj, class: classes
      end

      def ul_class
        ['pagination', container_attributes[:class]].compact.join(' ')
      end
    end
  end
end
