class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer    :area_id, null: false
      t.string     :prefecture, null: false
      t.string     :municipality, null: false
      t.string     :adress, null: false
      t.string     :bulding_name
      t.string     :number, null: false
      t.references :purchase_information, null: false, foreign_key: true

      t.timestamps
    end
  end
end
