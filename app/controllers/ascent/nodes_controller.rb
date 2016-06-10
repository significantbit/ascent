module Ascent
  class NodesController
    def show
      @node = Ascent::Node.find params[:id]
    end
  end
end
