## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |

| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| t-name1    | text   | null: false |
| t-name2    | text   | null: false |
| birth      | text   | null: false |

## items  テーブル

| Column       | Type             | Options          |
| ------       | ------           | -----------      |

| title        | string           | null: false      |
| price        | text             | null: false      |
| catch_copy   | text             | null: false      |
| category     | text             | null: false      |
| user         | references       |                  |


## comments  テーブル

| Column        | Type       | 
| Options         |  
| ------        | ---------- | ------------------|

| text          | text       | null: false 
                  
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |


## place  テーブル

| Column       | Type             | Options          |
| ------       | ------           | -----------      |

| pos_code     | string           | null: false      |
| prefecture1  | text             | null: false      |
| prefecture2  | text             | null: false      |
| building     | text             |                  |
| phone_num    | string           | null: false      |


