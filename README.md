# Link

# 概要
毎回開いたり、再読したいというページリンクを登録していつでも開けるようにする  
リンクを用途別にグループ化して登録できる  
グループ化したリスト内のすべてのリンクをワンクリックで一度で開くことができる（chromeの設定でポップアップがブロックされている場合は開かれない)  

<br>

# 本番環境
https://link-box-0.herokuapp.com/  
- Basic認証  
white-user  
white-pass  

- ログイン情報（テスト用)  
email : white@com  
password : white1000  

<br>

# 制作背景(意図)
今は時間に余裕がないからあとで読みたいというようなページをタブに残しておくと散らかって使いづらくなる。そのため、あとで読みたいとか毎回開くページがあれば保存し、用途別にグループ化して整理もできたらいいと思った
グループ化したリスト内のリンクをすべて開きたいときもあるので、ワンタップで同時に開けるようにすれば便利だと思った
<br>

# DEMO

メイン画面
![main-view](https://user-images.githubusercontent.com/61821997/96987225-adfb4700-155d-11eb-8621-655556fae48c.gif)

新規登録画面
![sign-up-view](https://user-images.githubusercontent.com/61821997/96987551-22ce8100-155e-11eb-89bb-77b40e961e80.gif)

リスト編集・削除画面
![edit-view](https://user-images.githubusercontent.com/61821997/96990908-af7b3e00-1562-11eb-86b4-c9750b49f134.gif)

<br>

# 工夫したポイント
画面遷移をせずにリストを作成したり、リンクを保存できるようにしたこと  
どこのリンクかわかりやすいようにfaviconを取得して表示させることで視認性を上げたこと  
グループ機能で、用途別に保存するリンクを分けられるようにしたこと  
グループ化されたグループ内のすべてのリンクをワンクリックで開けるようにしたこと  

<br>

# 使用技術(開発環境)
<br>

# バックエンド
Ruby, Ruby on Rails

<br>

# フロントエンド
HTML, CSS, JavaScript, Ajax

<br>

# データベース
MySQL, SequelPro

<br>

# webサーバー(本番環境)
Heroku, Cowboy

# ソース管理
GitHub, GitHubDesktop

<br>

# テスト
RSpec

<br>

# エディタ
VSCode

<br>

# 課題や今後実装したい機能
- リンクのコピーボタン
- タイトル検索機能
- Ajax通信でURLを画面にドロップするだけで保存できる機能
- SNS認証機能

<br>

# DB設計

## usersテーブル

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| nickname | string | null: false              |
| email    | string | null: false, unique: true|
| password | string | null: false              |

### Association
- has_many :contents
- has_many :boxes

<br>

## boxesテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |
| position | integer    | null: false |
| user     | references | null: false, foreign_key: true |

### Association
- has_many :connects
- belongs_to :user

<br>

## connectsテーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| title    | string      | null: false                    |
| my_link  | string      | null: false                    |
| position | integer     | null: false                    |
| user     | references  | null: false, foreign_key: true |
| box      | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :box