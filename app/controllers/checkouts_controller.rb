class CheckoutsController < ApplicationController
  ORDER_STATUS = {
    address: Checkout::OrderAddressUpdateService,
    delivery: Checkout::OrderDeliveryUpdateService,
    payment: Checkout::OrderCardUpdateService
  }.freeze

  def show
    service = change_order_status if params[:status]
    clear_cart_id if params[:status] == 'checkout_complete'

    @order = service&.completed_order&.decorate || current_cart.decorate
  end

  def update
    service_class = ORDER_STATUS[current_cart.status.to_sym]
    service = service_class.call(order: current_cart, order_params: order_params)

    flash[:danger] = service.errors_message unless service.success?
    redirect_to checkout_path
  end

  private

  def order_params
    params.require(:order).permit(:only_billing, :delivery_id,
                                  billing_address: %i[first_name last_name country city address zip phone address_type],
                                  shipping_address: %i[first_name last_name country city address zip phone address_type],
                                  card: %i[number name expiry_date cvv])
  end

  def change_order_status
    Orders::ChangeOrderStatusService.call(order: current_cart, status: params[:status], user: current_user)
  end

  def clear_cart_id
    session[:cart_id] = nil
  end
end
