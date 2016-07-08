module Ascent
  class NodesController < Ascent::AscentController
    def show
      @node = Ascent::Node.find params[:id]
    end
  end
end
