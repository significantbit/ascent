require 'closure_tree'

module Ascent
  class Node < ApplicationRecord
    has_closure_tree order: 'sort_order'

    has_many :node_blocks, dependent: :destroy

    after_validation :create_slug
    after_save :create_url

    def create_slug
      self.slug = self.name.to_s.parameterize
    end

    def create_url
      self.update_column(:url, '/' + self_and_ancestors.reject { |n| n.root? }.map { |n| n.slug }.reverse.join('/'))
      self.descendants.each do |d|
        d.create_url
      end
      Ascent::Engine.reload
    end
  end
end
