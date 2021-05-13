## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |

| email             | string | null: false,unique: true |
| encrypted_password| string | null: false |
| name              | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birth             | date   | null: false |

has_many :record
has_many :item



## items  テーブル

| Column       | Type        | Options     |
| ------       | ------      | ----------- |

| title        | string      | null: false |
| price        | integer     | null: false |
| catch_copy   | text        | null: false |
| category_id  | integer     | null: false |
| condition_id | integer     | null: false |
| fee_id       | integer     | null: false |
| area_id      | integer     | null: false |
| days_id      | integer     | null: false |
| user         | references  | null: false |

has_many :records
belongs_to :place
belongs_to :user


## places  テーブル

| Column       | Type      | Options          |
| ------       | ------    | -----------      |
| pos_code     | string    | null: false      |
| prefecture   | string    | null: false      |
| city         | string    | null: false      |
| address      | string    | null: false      |
| building     | string    |                  |
| phone_num    | string    | null: false      |
| record       | references| null: false, foreign_key: true|

belongs_to :item


## records  テーブル
| Column        | Type       |
| Options         |  
| ------        | ---------- |      ------------------|                 
| user          | references | null: false, foreign_key: true |
| items         | references | null: false|

belongs_to :item
belongs_to :user