module Cart
  class CurrentCartService
    def initialize(current_user = nil)
      @current_user = current_user
    end

    def call
      if @current_user
        Order.user_pending_order(@current_user).exists? ? Order.user_pending_order(@current_user).first : Order.create(user_id: @current_user.id)
      else
        Order.create
      end
    end
  end
end
