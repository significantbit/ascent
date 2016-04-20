require 'active_support/concern'
# Mountable Class for Ascent
# Adding this code to your model will make it a Block in ascent
module Ascent
  module Mountable
    extend ActiveSupport::Concern

    included do
      has_one :node_block, as: :mountable, dependent: :destroy
      has_many :nodes, through: :node_blocks
    end
  end
end
