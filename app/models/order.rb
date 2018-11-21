class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product


  def sub_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.total_price
    end
      sum
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
end