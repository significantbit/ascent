module Ascent
  module Admin
    class NodesController < Ascent::AdminController
      before_action :node, only: [:show, :edit, :update, :destroy]
      def index
        @nodes = Ascent::Node.root.self_and_descendants
      end

      def show
      end

      def new
        @object = Ascent::Node.new
      end

      def create
        @object = Ascent::Node.new
        @object = Ascent::Node.create resource_params
        if @object.save
          msg = t('ascent.node.create.success')
          redirect_to ascent_admin.node_path(@object), flash: { success: msg }
        else
          flash[:danger] = I18n.t('ascent.admin.node.create.error')
          render :new
        end
      end

      def edit
      end

      def update
        if @object.update resource_params
          msg = t('ascent.node.update.success')
          redirect_to ascent_admin.node_path(@object), flash: { success: msg }
        else
          flash[:danger] = I18n.t('ascent.admin.node.update.error')
          render :edit
        end
      end

      def destroy
        if @object.destroy
          flash[:success] = I18n.t('ascent.admin.node.destroy.success')
          redirect_to ascent_admin.nodes_path
        else
          flash[:danger] = I18n.t('ascent.admin.node.destroy.error')
          redirect_to ascent_admin.nodes_path
        end
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
