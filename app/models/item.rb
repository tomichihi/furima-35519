class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :area
  belongs_to       :category
  belongs_to       :condition
  belongs_to       :days
  belongs_to       :fee
  belongs_to       :user
  has_one          :record
  has_one_attached :image

  with_options numericality: { other_than: 0 } do
  validates :area_id
  validates :category_id
  validates :condition_id
  validates :days_id
  validates :fee_id
  end

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
