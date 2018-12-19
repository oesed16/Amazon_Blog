class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @item.save
    session[:order_id] = @order.id
    redirect_to cart_path
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
