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
|id|integer|null: false, unique: true|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_katakana|string|null: false|
|first_name_katakana|string|null: false|
|birthday|integer|null: false|
|postal_code|integer||
|prefecture|??||
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
- has_many :comments
- has_many :points
- has_many :products, through: :favorites


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|product_name|string|null: false|
|seller_user_id|reference|foreign_key: true|
|buyer_user_id|reference|foreign_key: true|
|brand_id|reference|foreign_key: true|
|low_category_id|referene|foreign_key: true|
|mid_category_id|referene|foreign_key: true|
|high_category_id|referene|foreign_key: true|
|introduction|text||
|product_size|??|null: false|
|product_state|??|null: false|
|who_pays_shipping_fee|??|null: false|
|seller_prefecture|??|null: false|
|days_to_ship|??|null: false|
|price|integer|null: false|
|trade_state|integer|null: false|

### Association
- belongs_to :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
- belongs_to :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
- belongs_to :brand
- belongs_to :top_category
- belongs_to :mid_category
- belongs_to :low_category
- has_many :comments
- has_many :product_images
- has_many :users, through: :favorites

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|reference|foreign_key: true|
|product_id|reference|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## ratesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|rater_user_id|reference|foreign_key: true|
|rated_user_id|reference|foreign_key: true|
|comment|text|null: false|
|rate|integer|null: false|

### Association
- belongs_to :rater_user, class_name: 'User', foreign_key: 'rater_user_id'
- belongs_to :rated_user, class_name: 'User', foreign_key: 'rated_user_id'

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|reference|foreign_key: true|
|given_point|integer|null: false|
|remark|string||

### Association
- belongs_to :user

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|reference|foreign_key: true|
|product_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product