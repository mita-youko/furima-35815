# テーブル設計

## users テーブル

| Colum          | Type       | Options      |
| ------------   | ---------- | ------------ |
| nickname       | string     | null: false  |
| email          | string     | null: false  |
| password       | string     | null: false  |

### Association
- has_many :items
- has_many :records
- has_one :profile

## profiles テーブル

| Colum            | Type       | Options                         |
| --------------   | ---------- | ------------------------------  |
| last_name        | string     | null: false                     |
| first_name       | string     | null: false                     |
| last_name_kana   | string     | null: false                     |
| first_name_kana  | string     | null: false                     |
| birth_year_id    | integer    | null: false                     |
| birth_month_id   | integer    | null: false                     |
| birth_day_id     | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association
- belongs_to :user

## items テーブル

| Colum        | Type        | Options                         |
| ----------   | ----------  | ------------------------------- |
| name         | string      | null: false                     |
| description  | text        | null: false                     |
| category_id  | string      | null: false,                    |
| condition_id | string      | null: false,                    |
| sip_cost_id  | string      | null: false                     |
| sip_area_id  | string      | null: false                     |
| sip_date_id  | string      | null: false                     |
| price        | integer     | null: false                     |
| seller       | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :record

## records テーブル

|  Colum     | Type        | Options                         |
| ---------- | ----------  | ------------------------------- |
| buyer      | references  | null: false, foreign_key: true  |
| item       | references  | null: false, foreign_key: true  |
| address    | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

|  Colum           | Type        | Options                         |
| ---------------- | ----------  | ------------------------------- |
| postal_code      | integer     | null: false, foreign_key: true  |
| prefecture       | string      | null: false, foreign_key: true  |
| city             | string      | null: false, foreign_key: true  |
| house_number     | string      | null: false, foreign_key: true  |
| building_name    | string      | null: false, foreign_key: true  |
| phone_number     | integer     | null: false, foreign_key: true  |
| buyer            | references  | null: false, foreign_key: true  |

### Association
- belongs_to :record
