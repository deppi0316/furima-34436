# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| last_name_kanji  | string   | null: false |
| first_name_kanji | string   | null: false |
| last_name_kana   | string   | null: false |
| first_name_kana  | string   | null: false |
| birthday         | datetime | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_method | string     | null: false                    |
| delivery_area   | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| credit_card_number   | integer    | null: false                    |
| credit_card_deadline | integer    | null: false                    |
| credit_card__code    | integer    | null: false                    |
| postal_code          | integer    | null: false                    |
| prefecture           | string     | null: false                    |
| municipality         | string     | null: false                    |
| address              | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| item_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user