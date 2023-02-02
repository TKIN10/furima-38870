class PurchaseInformationShippingAddress
  include ActiveModel::Model
  attr_accessor :area_id, :postal_code, :municipality, :adress, :bulding_name, :number, :user_id, :item_id

  validates :area_id, presence: true,format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :postal_code, presence: true
  validates :municipality, presence: true
  validates :adress, presence: true
  validates :bulding_name, presence: true
  validates :number, presence: true,format: { with: /\A\d{10,11}\z/ }

  def save
    purchase_information = PurchaseInformation.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(area_id: area_id, postal_code:postal_code, municipality:municipality, adress:adress, bulding_name:bulding_name, number:number)
  end
end