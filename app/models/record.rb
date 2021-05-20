class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one    :place

  validates :price, presence: true
  validates :token, presence: true
  
end
