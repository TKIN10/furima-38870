class PurchaseInformationShippingAddress
  include ActiveModel::Model
  attr_accessor :area_id, :postal_code, :municipality, :adress, :bulding_name, :number, :user_id, :item_id, :token

  validates :area_id, presence: true, numericality: { other_than: 1 }
  validates :postal_code, presence: true,format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :municipality, presence: true
  validates :adress, presence: true
  validates :number, presence: true,format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true

  def save
    purchase_information = PurchaseInformation.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(area_id:area_id, postal_code:postal_code, municipality:municipality, adress:adress, bulding_name:bulding_name, number:number, purchase_information_id:purchase_information.id)
  end
end