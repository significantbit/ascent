module Ascent
  class AdminController < Ascent::Config.parent_controller.constantize
    layout 'ascent/admin'

    def dashboard
    end

    def nodes
    end
  end
end
