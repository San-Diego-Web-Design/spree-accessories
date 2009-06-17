module AccessoriesHelper

  # find the accessories not currently in the order list
  # better as named scope?
  def not_ordered_accessories(order)
    order_prods = order.line_items.map { |li| li.variant.product }
    accessories = order_prods.map { |p| p.accessories}.flatten.uniq
    accessories.reject {|a| order_prods.include? a }
  end

end
