class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :number_of_day
  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :amount_of_money, presence: true, numericality: { with: VALID_PRICEL_HALF, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :area_id, presence: true, numericality: { other_than: 1 }
  validates :number_of_day_id, presence: true, numericality: { other_than: 1 } 
end
