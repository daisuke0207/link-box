# Link

# 概要
毎回開いたり、再読したいというページリンクを登録していつでも開けるようにする。  
リンクを用途別にグループ化して登録できる。  
グループ化したリスト内のすべてのリンクをワンクリックで一度で開くことができる。（chromeの設定でポップアップがブロックされている場合は開かれない)  

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
今は時間に余裕がないから、あとで読みたいというようなページをタブに残しておくと散らかって使いづらくなる。そのため、あとで読みたいとか毎回開くページがあれば保存し、用途別にグループ化して整理もできたら管理しやすくなる。
グループ化したリスト内のリンクをすべて開きたいときもあるので、ワンタップで同時に開けるようことで一つずつ開く手間をなくすと便利だと思った。
<br>

# DEMO

ログアウト状態の画面
![logout_view](https://user-images.githubusercontent.com/61821997/98667657-0de15280-2392-11eb-9d00-9a9c4df9089f.gif)

新規登録画面
![registration](https://user-images.githubusercontent.com/61821997/98669526-d58f4380-2394-11eb-809b-1d52481d2802.gif)

グループとリンクの作成機能
![create_box_link](https://user-images.githubusercontent.com/61821997/98667881-63b5fa80-2392-11eb-8021-c18ce8b77f72.gif)

リンクを開く機能
![open_link](https://user-images.githubusercontent.com/61821997/98667778-3e28f100-2392-11eb-9cb4-eff25e97bf5d.gif)

すべてのリンクを開く機能
![all_open_link](https://user-images.githubusercontent.com/61821997/98667791-441ed200-2392-11eb-80ac-eb66986c4b81.gif)

編集・削除機能
![edit_delete](https://user-images.githubusercontent.com/61821997/98670287-dbd1ef80-2395-11eb-8dcd-a8d20554e28d.gif)

<br>

# 工夫したポイント
- 画面遷移をせずにリストを作成したり、リンクを保存できるようにしたこと。  
- どこのリンクかわかりやすいようにfaviconを取得して表示させることで視認性を上げたこと。  
- グループ機能で、用途別に保存するリンクを分けられるようにしたこと。  
- グループ化されたグループ内のすべてのリンクをワンクリックで開けるようにしたこと。  

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
- リンクの登録をもう少し簡単にできるようにする
- グループの複製機能
- 共有機能

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