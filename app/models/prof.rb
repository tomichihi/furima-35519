class Prof < ApplicationRecord
  belongs_to :user

  validates :hobby, presence:true
  validates :comment, presence:true
 end

