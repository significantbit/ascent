require 'active_support/concern'

module Ascent
  module Mountable
    extend ActiveSupport::Concern

    included do
      has_one :node_block, as: :mountable, dependent: :destroy
      has_many :nodes, through: :node_blocks
    end
  end
end
