## usersテーブル

|Column            |Type    |Options    |
|------------------|--------|-----------|
|nickname          |string  |null: false|
|email             |string  |null: false,unique: true|
|encrypted_password|string  |null: false|
|myouji            |string  |null: false|
|namae             |string  |null: false|
|kanamyouji        |string  |null: false|
|kananamae         |string  |null: false|
|birthday          |date    |null: false|

### Association
has_many :commo_infos
has_many :send_records

## commo_infosテーブル

|Column               |Type      |Options    |
|---------------------|----------|-----------|
|commo_name           |string    |null: false|
|commo_ex             |text      |null: false|
|commo_cate_id        |string    |null: false|
|commo_st_id          |string    |null: false|
|commo_deli_carge_id  |string    |null: false|
|commo_deli_sor_id    |string    |null: false|
|commo_deli_day_id    |string    |null: false|
|commo_price          |integer   |null: false|
|nickname             |references|null: false,foreign_key: true|

### Association
belongs_to :users
has_one :buy_infos
has_one :send_records

## send_recordsテーブル

|Column            |Type      |Options    |
|------------------|----------|-----------|
|nickname          |references|null: false,foreign_key: true|
|commo_name        |references|null: false,foreign_key: true|

### Association
belongs_to :users
has_one :buy_info
belongs_to :commo_infos

## buy_infosテーブル

|Column              |Type    |Options    |
|--------------------|--------|-----------|
|post_code           |string  |null: false|
|prefectures_id      |string  |null: false|
|municipality        |string  |null: false|
|cities              |string  |null: false|
|building            |string  |null: false|
|tell_num            |string  |null: false|
|myouji              |references|null: false,foreign_key: true|
|namae               |references|null: false,foreign_key: true|

### Association