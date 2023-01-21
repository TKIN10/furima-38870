class Item < ApplicationRecord
  has_one :category
  has_one :condition
  has_one :delivery_charge
  has_one :area
  has_one :number_of_day
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
end
