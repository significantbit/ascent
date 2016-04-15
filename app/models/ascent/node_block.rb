module Ascent
  class NodeBlock < ApplicationRecord
    default_scope { order(:sort_order) }
    belongs_to :node, touch: true
    belongs_to :mountable, polymorphic: true, touch: true
  end
end
