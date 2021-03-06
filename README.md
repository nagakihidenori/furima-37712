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
has_many :commos
has_many :orders

## itemsテーブル

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
belongs_to :user
has_one :order

## ordersテーブル

|Column            |Type      |Options    |
|------------------|----------|-----------|
|user              |references|null: false,foreign_key: true|
|item              |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :send_record

## send_recordsテーブル

|Column              |Type    |Options    |
|--------------------|--------|-----------|
|post_code           |string  |null: false|
|prefecture_id       |integer |null: false|
|municipality        |string  |null: false|
|cities              |string  |null: false|
|building            |string  |           |
|tell_num            |string  |null: false|
|order               |references|null: false,foreign_key: true|

### Association
belongs_to :order