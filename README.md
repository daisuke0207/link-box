# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :contents
- has_many :boxes

## boxesテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |
| position | integer    | null: false |
| user     | references | null: false, foreign_key: true |

### Association
-has_many :connects
-belongs_to :user

## connectsテーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| title    | string      | null: false                    |
| my_link  | string      | null: false                    |
| text     | text        |                                |
| position | integer     | null: false                    |
| user     | references  | null: false, foreign_key: true |
| box      | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :box