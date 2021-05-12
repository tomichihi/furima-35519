## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |

| email          | string | null: false |
| password       | string | null: false |
| name           | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birth          | date   | null: false |

## items  テーブル

| Column       | Type             | Options     |
| ------       | ------           | ----------- |

| title        | string           | null: false |
| price        | integer          | null: false |
| catch_copy   | text             | null: false |
| category     | text             | null: false |
| condition    | text             |             |
| fee          | text             |             |
| area         | text             |             |
| days         | text             |             |
| user         | references       | null: false, foreign_key: true|



## comments  テーブル

| Column        | Type       | 
| Options         |  
| ------        | ---------- | ------------------|

| text          | text       | null: false 
                  
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |


## places  テーブル

| Column       | Type             | Options          |
| ------       | ------           | -----------      |
| pos_code     | string           | null: false      |
| prefecture   | string           | null: false      |
| city         | text             | null: false      |
| address      | text             | null: false      |
| building     | string           |                  |
| phone_num    | string           | null: false      |

## records  テーブル
| Column        | Type       |
| Options         |  
| ------        | ---------- |      ------------------|                 
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |

