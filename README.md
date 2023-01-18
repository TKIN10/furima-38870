# テーブル設計

## users テーブル

| Column   | Type     | Options                  |
| -------- | -------- | ------------------------ |
| nickname | string   | null: false,unique: true |
| email    | string   | null: false              |
| password | string   | null: false              |
| name     | string   | null: false              |
| katakana | string   | null: false              |
| DOB      | datetime | null: false              |

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| amount of money  | integer    | null: false                    |
| image            | string     | null: false                    |
| text             | text       | null: false                    |
| state            | references | null: false                    |
| rough_indication | datetime   | null: false                    |
| user             | references | null: false  foreign_key: true |
| shipping address | references | null: false  foreign_key: true |

### Association
- has_one :shipping address

## purchase informations テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| item   | references | null: false,foreign_key: true |

### Association
- has_one :shipping address

## shipping addresses テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| adress | text       | null: false                   |
| user   | references | null: false,foreign_key: true |

### Association
- belongs_to :item
- belongs_to :purchase information