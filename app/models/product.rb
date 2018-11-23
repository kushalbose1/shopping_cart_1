class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user        
  has_many_attached :image
  
  has_many :items
  has_many :oders
   def self.latest
    Product.order(:updated_at).last
  end
  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_item
      if items.empty?
        return true
      else
        errors.add(:base, ' Items present')
        return false
      end
    end
end