# frozen_string_literal: true

module Orders
  class ChangeOrderStatusService < BaseService
    attr_reader :completed_order

    def initialize(params)
      super
      @status = params[:status]
      @order = params[:order]
      @user = params[:user]
    end

    def call
      return unless valid_status?

      @order.update(status: @status)

      complete_order if @status == Order.statuses.key(4)
    end

    private

    def complete_order
      OrderMailer.order_completed(@order, @user).deliver

      @user.orders << @order
      @completed_order = @order
    end

    def valid_status?
      Order.statuses.except(:delivered, :canceled, :in_delivery).include?(@status)
    end
  end
end
