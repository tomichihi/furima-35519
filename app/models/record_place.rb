class RecordPlace
  include ActiveModel::Model
  attr_accessor :pos_code, :area_id, :city, :address, :building, :phone_num, :token, :user_id, :item_id

  with_options presence: true do
    validates :pos_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_num,length: { maximum: 11 },format:{with: /\A[0-9]+\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Place.create(pos_code: pos_code, area_id: area_id, city: city, address: address, building: building, phone_num: phone_num, record_id: record.id)
  end
  
end