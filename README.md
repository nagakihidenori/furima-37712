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

|Column               |Type       |Options    |
|---------------------|-----------|-----------|
|commo_name           |string     |null: false|
|commo_ex             |text       |null: false|
|commo_cate_id        |integer    |null: false|
|commo_st_id          |integer    |null: false|
|commo_deli_charge_id |integer    |null: false|
|prefecture_id        |integer    |null: false|
|commo_deli_day_id    |integer    |null: false|
|commo_price          |integer    |null: false|
|user                 |references |null: false,foreign_key: true|

### Association
belongs_to :users
has_one :send_record

## send_recordsテーブル

|Column            |Type      |Options    |
|------------------|----------|-----------|
|user              |references|null: false,foreign_key: true|
|commo_info        |references|null: false,foreign_key: true|

### Association
belongs_to :users
has_one :commo_info
has_one :buy_info

## buy_infosテーブル

|Column              |Type    |Options    |
|--------------------|--------|-----------|
|post_code           |string  |null: false|
|prefecture_id       |integer |null: false|
|municipality        |string  |null: false|
|cities              |string  |null: false|
|building            |string  |           |
|tell_num            |string  |null: false|
|send_record         |references|null: false,foreign_key: true|

### Association
has_one :send_record