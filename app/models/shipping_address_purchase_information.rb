class PurchaseInformationShippingAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :area_id, :prefecture, :municipality, :adress, :bulding_name, :number, :user_id

  validates :area_id, presence: true,format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :adress, presence: true
  validates :bulding_name, presence: true
  validates :number, presence: true,format: { with: /\A\d{10,11}\z/ }

  def save
    purchase_information = Purchase_information.create (user_id: user_id)

    shipping_address.create (area_id: area_id, prefecture:prefecture, municipality:municipality, adress:adress, bulding_name:bulding_name, number:number)
  end
end