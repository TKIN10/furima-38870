class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  has_one :purchase_information
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :number_of_day
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    validates :amount_of_money, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, numericality: { other_than: 1,message: 'を選択してください'}
    validates :condition_id, numericality: { other_than: 1,message: 'を選択してください'}
    validates :delivery_charge_id, numericality: { other_than: 1,message: 'を選択してください'}
    validates :area_id, numericality: { other_than: 1,message: 'を選択してください'}
    validates :number_of_day_id, numericality: { other_than: 1,message: 'を選択してください'} 
  end
end
