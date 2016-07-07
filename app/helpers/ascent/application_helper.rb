module Ascent
  module ApplicationHelper
    include Ascent::MainHelper

    def breadcrumbs(node, path, engine = Rails.application)
      list = ''
      node.self_and_ancestors.reverse_each do |n|
        url = engine.routes.url_helpers.send(path, n)
        list << "<li>#{link_to(n.name, url)}</li>"
      end
      list.html_safe
    end
  end
end
