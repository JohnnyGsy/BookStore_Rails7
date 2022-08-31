module Cart
  class CurrentCartService
    def initialize(current_user = nil)
      @current_user = current_user
    end

    def call
      if @current_user
        user_pending_order || Order.create(user_id: @current_user.id)
      else
        Order.create
      end
    end

    private

    def user_pending_order
      Order.where(status: :pending, user_id: @current_user.id).first
    end
  end
end
