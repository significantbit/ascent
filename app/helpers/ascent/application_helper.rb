module Ascent
  module ApplicationHelper
    def breadcrumbs(node, path = nil, engine = Rails.application)
      list = ''
      node.self_and_ancestors.reverse_each do |n|
        if !path.nil?
          url = engine.routes.url_helpers.send(path, n)
          list << "<li>#{link_to(n.name, url)}</li>"
        else
          list << "<li>#{n.name}</li>"
        end
      end
      list.html_safe
    end
  end
end
