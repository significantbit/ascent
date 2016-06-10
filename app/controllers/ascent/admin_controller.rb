module Ascent
  class AdminController < Ascent::Config.parent_controller.constantize
    layout 'ascent/admin'

    def dashboard
    end
  end
end
