# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_katakana|string|null: false|
|first_name_katakana|string|null: false|
|birthday|integer|null: false|
|postal_code|integer||
|prefecture|string?||
|city|string||
|address|string||
|building|string||
|phone_number|integer|null: false|
|addressee_first_name|string|null: false|
|addressee_last_name|string|null: false|
|addressee_first_name_katakana|string|null: false|
|addressee_first_name_katakana|string|null: false|
|addressee_birthday|integer|null: false|
|addressee_postal_code|integer|null: false|
|addressee_prefecture|string?|null: false|
|addressee_city|string|null: false|
|addressee_address|string|null: false|
|addressee_building|string|null: false|
|introduction|text||
|avatar|string||
|point|integer|null: false|


### Association
- has_many :products
- has_many :favorites
- has_many :evaluations
- has_many :comment
- has_many :point


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user