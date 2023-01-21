class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :category
  has_one :condition
  has_one :delivery_charge
  has_one :area
  has_one :number_of_day
  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :amount_of_money, presence: true, only_integer: true, {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category, presence: true, numericality: { other_than: 1 }
  validates :condition, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge, presence: true, numericality: { other_than: 1 }
  validates :area, presence: true, numericality: { other_than: 1 }
  validates :number_of_day, presence: true, numericality: { other_than: 1 } 
end
