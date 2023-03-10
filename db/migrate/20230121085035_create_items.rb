class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name, null: false
      t.text       :item_text, null: false
      t.integer    :amount_of_money, null: false
      t.integer    :category_id, null: false
      t.integer    :condition_id, null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :area_id, null: false
      t.integer    :number_of_day_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
