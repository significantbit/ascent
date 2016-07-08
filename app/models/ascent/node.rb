require 'closure_tree'

module Ascent
  class Node < ActiveRecord::Base
    has_closure_tree order: 'sort_order'

    has_many :node_blocks, dependent: :destroy

    belongs_to :parent, class_name: 'Ascent::Node'

    after_validation :create_slug
    after_save :create_url

    validates :name, presence: true

    scope :published, -> { where(published: true) }

    def create_slug
      self.slug = name.to_s.parameterize
    end

    def create_url
      gurl = "/#{self_and_ancestors.reject(&:root?).map(&:slug).reverse.join('/')}"
      update_column(:url, gurl)
      descendants.each(&:create_url)
      Ascent::Engine.reload_routes
      gurl
    end

    ascent do
      exclude :slug, :url, :sort_order
      collection_scope :parent_id, Proc.new { |scope, obj |
        scope.where.not(id: [obj.id]) if obj.present?
      }
    end
  end
end
