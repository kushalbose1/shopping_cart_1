class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many_attached :image
  has_many :carts
  has_many :line_items
  has_many :orders
   def self.latest
    Product.order(:updated_at).last
  end
  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end