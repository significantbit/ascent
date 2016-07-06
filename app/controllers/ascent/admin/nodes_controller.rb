module Ascent
  module Admin
    class NodesController < Ascent::AdminController
      before_filter :node, only: [:show, :edit, :update, :destroy]
      def index
        @nodes = Ascent::Node.root.self_and_descendants
      end

      def show
      end

      def new
        @object = Ascent::Node.new
      end

      def create
        @object = Ascent::Node.create resource_params
        if @object.save
          redirect_to ascent_admin.nodes_path, success: t('ascent.node.create.success')
        else
          flash[:alert] = I18n.t("ascent.node.create.error")
          render :new
        end
      end

      def edit
      end

      def update
        if @object.update resource_params
          redirect_to ascent_admin.nodes_path, success: t('ascent.node.create.success')
        else
          flash[:alert] = I18n.t("ascent.node.create.error")
          render :new
        end
      end

      def destroy
      end

      private

      def node
        @object ||= Ascent::Node.find params[:id]
      end

      def resource_name
        @object.model_name.param_key
      end

      def resource_params
        params.fetch(resource_name, {}).permit!
      end
    end
  end
end
