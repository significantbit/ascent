require 'closure_tree'

module Ascent
  class Node < ActiveRecord::Base
    has_closure_tree order: 'sort_order'

    has_many :node_blocks, dependent: :destroy

    after_validation :create_slug
    after_save :create_url

    scope :published, -> { where(published: true)}

    def create_slug
      self.slug = name.to_s.parameterize
    end

    def create_url
      gurl = "/#{self_and_ancestors.reject(&:root?).map(&:slug).reverse.join('/')}"
      update_column(:url, gurl)
      descendants.each(&:create_url)
      Ascent::Engine.reload_routes
    end
  end
end
