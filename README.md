# テーブル設計

## users テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| nickname            | string   | null: false |
| email               | string   | null: false |
| encrypted_password  | string   | null: false |
| last_name           | string   | null: false |
| first_name          | string   | null: false |
| last_name_katakana  | string   | null: false |
| first_name_katakana | string   | null: false |
| birthday            | date     | null: false |

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_text       | text       | null: false                    |
| amount_of_money | integer    | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| area            | string     | null: false                    |
| number_of_days  | string     | null: false                    |
| user            | references | null: false  foreign_key: true |

### Association
- has_one :shipping_address

## purchase_informations テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| item   | references | null: false,foreign_key: true |

### Association
- has_one :shipping_address

## shipping_addresses テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| postal_code | string     | null: false                   |
| adress      | string     | null: false                   |
| number      | string     | null: false                   |
| user        | references | null: false,foreign_key: true |

### Association
- belongs_to :item
- belongs_to :purchase_information