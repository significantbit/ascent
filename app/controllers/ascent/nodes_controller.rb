module Ascent
  class NodesController < Ascent::ApplicationController
    def show
      @node = Ascent::Node.find params[:id]
    end
  end
end
