module Ascent
  class AdminController < Ascent::Config.parent_controller.constantize
    before_action :_authenticate!

    helper_method :_current_user

    layout 'ascent/admin'

    def dashboard
    end

    def _current_user
      instance_eval(&Ascent::Config.current_user_method)
    end

    private

    def _authenticate!
      instance_eval(&Ascent::Config.authenticate_with)
    end
  end
end
