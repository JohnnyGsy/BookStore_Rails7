module Cart
  class CurrentCartService
    def initialize(session, current_user = nil)
      @current_user = current_user
      @session = session
    end

    def call
      return Order.find(@session[:cart_id]) unless @session[:cart_id].nil?

      if @current_user
        user_pending_order || Order.create(user_id: @current_user.id)
      else
        Order.create
      end
    end

    private

    def user_pending_order
      Order.where(status: %i[address delivery payment], user_id: @current_user.id).first
    end
  end
end
