class OrderDecorator < Draper::Decorator
  delegate_all
  decorates_associations :order_items, :addresses, :card

  def order_items_subtotal
    order_items.sum(&:subtotal)
  end

  def discount
    coupon&.sale || 0.0
  end

  def delivery_price
    delivery_type&.price || 0.0
  end

  def order_discount
    - order_items_subtotal * discount
  end

  def order_total
    order_items_subtotal + delivery_price + order_discount
  end

  def address_credentials_full_name(address_type)
    order_address(address_type).decorate.full_name
  end

  def order_address_address(address_type)
    order_address(address_type).address
  end

  def order_address_country(address_type)
    ISO3166::Country.find_country_by_alpha2(order_address(address_type).country)
  end

  def address_city_with_zip(address_type)
    "#{order_address(address_type).city} #{order_address(address_type).zip}"
  end

  def address_phone(address_type)
    order_address(address_type).phone
  end

  def order_address(address_type)
    address_type == 'billing' ? billing_address : shipping_address
  end

  def status_done?(status)
    status_before_type_cast > Order.statuses[status]
  end

  def last_status?(index)
    order_checkout_statuses.count - 1 == index
  end

  def order_checkout_statuses
    %i[address delivery payment confirm checkout_complete]
  end

  def passed_status?(status)
    status_done?(status) || self.status == status
  end

  def humanized_status
    status.humanize
  end
end
