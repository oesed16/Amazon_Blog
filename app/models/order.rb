class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    # order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    self.order_items.collect { |oi| oi.product.price * oi.quantity }.sum
  end
  
  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    # self[:subtotal] = subtotal
    self.total = subtotal
  end
end
