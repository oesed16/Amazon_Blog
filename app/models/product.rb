class Product < ApplicationRecord
    has_many :order_items
    default_sope { where(active: true) }
end
