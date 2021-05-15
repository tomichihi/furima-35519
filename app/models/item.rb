class Item < ApplicationRecord
  has_one :record
  belongs_to :user
  
  with_options presence: true do
  validates :title
  validates :price
  validates :catch_copy
  validates :category_id
  validates :fee_id
  validates :area_id
  validates :days_id
  validates :user    
  end
end
