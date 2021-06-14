# テーブル設計

## users テーブル

| Colum              | Type       | Options      |
| ----------------   | ---------- | ------------ |
| nickname           | string     | null:false   |
| email              | string     | unique: true |
| encrypted_password | string     | null: false  |
| last_name          | string     | null: false  |
| first_name         | string     | null: false  |
| last_name_kana     | string     | null: false  |
| first_name_kana    | string     | null: false  |                    
| birthday_id        | date       | null: false  | 

### Association
- has_many :items
- has_many :records

## items テーブル

| Colum        | Type        | Options                         |
| ----------   | ----------  | ------------------------------- |
| name         | string      | null: false                     |
| description  | text        | null: false                     |
| category_id  | integer     | null: false                     |
| condition_id | integer     | null: false                     |
| sip_cost_id  | integer     | null: false                     |
| prefecture_id| integer     | null: false                     |
| sip_date_id  | integer     | null: false                     |
| price        | integer     | null: false                     |
| user         | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :record

## records テーブル

|  Colum     | Type        | Options                         |
| ---------- | ----------  | ------------------------------- |
| user       | references  | null: false, foreign_key: true  |
| item       | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

|  Colum           | Type        | Options                         |
| ---------------- | ----------  | ------------------------------- |
| postal_code      | string      | null: false                     |
| prefecture_id    | integer     | null: false                     |
| city             | string      | null: false                     |
| house_number     | string      | null: false                     |
| building_name    | string      |                                 |
| phone_number     | string      | null: false                     |
| record           | references  | null: false, foreign_key: true  |

### Association
- belongs_to :record
