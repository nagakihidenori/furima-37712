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
|birthday          |string  |null: false|

### Association
has_many :commoinfos
has_many :sendrecord

## commo_infosテーブル

|Column            |Type    |Options    |
|------------------|--------|-----------|
|commo_name        |string  |null: false|
|commo_ex          |string  |null: false|
|commo_cate        |string  |null: false|
|commo_st          |string  |null: false|
|commo_deli_carge  |string  |null: false|
|commo_deli_sor    |string  |null: false|
|commo_deli_day    |string  |null: false|
|commo_price       |string  |null: false|

### Association
belongs_to :users
has_one_attached :buyinfos
has_one_attached :sendrecord

## send_recordsテーブル

|Column            |Type    |Options    |
|------------------|--------|-----------|
|who_send          |string  |null: false|
|what_send         |string  |null: false|

### Association
belongs_to :users
has_one_attached :buyinfos
has_one_attached :sendrecord

## buy_infosテーブル

|Column            |Type    |Options    |
|------------------|--------|-----------|
|post_code         |string  |null: false|
|prefectures       |string  |null: false|
|municipality      |string  |null: false|
|cities            |string  |null: false|
|tell_num          |string  |null: false|

### Association
has_one_attached :commo_infos