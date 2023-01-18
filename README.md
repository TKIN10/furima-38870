# テーブル設計

## users テーブル

| Column              | Type     | Options                  |
| ------------------- | -------- | ------------------------ |
| nickname            | string   | null: false              |
| email               | string   | null: false,unique: true |
| encrypted_password  | string   | null: false              |
| last_name           | string   | null: false              |
| first_name          | string   | null: false              |
| last_name_katakana  | string   | null: false              |
| first_name_katakana | string   | null: false              |
| birthday            | date     | null: false              |

### Association
- has_many :items
- has_many :shipping_address

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item_name          | string      | null: false                    |
| item_text          | text        | null: false                    |
| amount_of_money    | integer     | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| delivery_charge_id | integer     | null: false                    |
| area_id            | integer     | null: false                    |
| number_of_day_id   | integer     | null: false                    |
| user               | references  | null: false  foreign_key: true |

### Association
- has_one :user

## purchase_informations テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| item   | references | null: false,foreign_key: true |

### Association
- has_one :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| postal_code          | string     | null: false                   |
| prefecture           | string     | null: false                   |
| municipality         | string     | null: false                   |
| adress               | string     | null: false                   |
| bulding_name         | string     | null: false                   |
| number               | string     | null: false                   |
| purchase_information | references | null: false,foreign_key: true |

### Association
- belongs_to :purchase_information