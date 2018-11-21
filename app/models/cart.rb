class Cart < ApplicationRecord
	 has_many :line_items , dependent: :destroy
     has_many :products, through: :line_items
     belongs_to :product,optional: true
  # LOGIC
    

    def add_product(product_id)
    current_item= line_items.find_by(product_id: product_id)
    if current_item
        current_item.quantity +=1
    else
        current_item= line_items.build(product_id: product_id)  
    end 
    current_item
end
end
