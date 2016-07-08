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

    def logout_path
      if defined?(Devise)
        scope = Devise::Mapping.find_scope!(_current_user) rescue false
        main_app.send("destroy_#{scope}_session_path") rescue false
      else
        main_app.logout_path if main_app.respond_to?(:logout_path)
      end
    end

    def logout_method
      return [Devise.sign_out_via].flatten.first if defined?(Devise)
      :delete
    end
  end
end
