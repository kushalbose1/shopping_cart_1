class Cart < ApplicationRecord
	 has_many :items, dependent: :destroy
     has_many :products, through: :items
     belongs_to :user

  def add_item(product_id)
    @item = Item.find(product_id: product_id)
    item.quantity += 1
    item.save
  end
end

