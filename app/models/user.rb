class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable     
  validates :first_name, :last_name, :email, :phonenum, :houseno, :shippingaddress,
            :houseno, :city, :state, :pincode, presence: true
  has_many  :products
         

  def is_admin?
    self.user_type == "admin"
  end
  def is_seller?
    self.user_type == "seller"
  end
  def is_buyer?
    self.user_type == "buyer"
  end
end
