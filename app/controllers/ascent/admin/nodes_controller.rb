module Ascent
  module Admin
    class NodesController < AdminController
      before_filter :node, only: [:show, :edit, :update, :destroy]
      def index
        @nodes = Ascent::Node.root.self_and_descendants
      end

      def show
      end

      def new
        @node = Ascent::Node.new
      end

      def create
      end

      def edit
      end

      def update
      end

      def destroy
      end

      private

      def node
        @node ||= Ascent::Node.find params[:id]
      end
    end
  end
end
