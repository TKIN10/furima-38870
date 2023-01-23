class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  has_one :category
  has_one :condition
  has_one :delivery_charge
  has_one :area
  has_one :number_of_day
  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :amount_of_money, presence: true, numericality: { in: 300..9999999 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :area_id, presence: true, numericality: { other_than: 1 }
  validates :number_of_day_id, presence: true, numericality: { other_than: 1 } 
end
