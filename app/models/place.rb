class Place < ApplicationRecord
  attr_accessor :token
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :area
  belongs_to :record

  with_options presence: true do
    validates :pos_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_num,length: { maximum: 9 }


  end
end
