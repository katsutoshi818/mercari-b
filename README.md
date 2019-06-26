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
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer|null: false|

### Association
- has_many :products
- has_many :favorites
- has_many :rates
- has_many :comments
- has_many :points
- has_many :products, through: :favorites
- has_one :addressee
- has_one :profile


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_katakana|string|null: false|
|last_name_katakana|string|null: false|
|birthday|integer|null: false|
|postal_code|integer||
|prefecture|integer||
|city|string||
|address|string||
|building|string||
|introduction|text||
|avatar|string||
|point|integer|null: false|

### Associations
- belongs_to :user


## addresseesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_katakana|string|null: false|
|last_name_katakana|string|null: false|
|birthday|integer|null: false|
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phonenumber|integer||

### Associations
- belongs_to :users


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|seller_user_id|reference|foreign_key: true|
|buyer_user_id|reference|foreign_key: true|
|brand_id|reference|foreign_key: true|
|category_id|reference|foreign_key: true|
|product_name|string|null: false|
|introduction|text|null: false|
|product_size|integer||
|product_state|integer|null: false|
|who_pays_shipping_fee|integer|null: false|
|seller_prefecture|integer|null: false|
|days_to_ship|integer|null: false|
|price|integer|null: false|
|trade_state|integer|null: false|

### Association
- belongs_to :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
- belongs_to :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
- belongs_to :brand
- belongs_to :category
- has_many :comments
- has_many :product_images
- has_many :users, through: :favorites

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|product_id|reference|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## ratesテーブル

|Column|Type|Options|
|------|----|-------|
|rater_user_id|reference|foreign_key: true|
|rated_user_id|reference|foreign_key: true|
|comment|text||
|rate|integer|null: false|

### Association
- belongs_to :rater_user, class_name: 'User', foreign_key: 'rater_user_id'
- belongs_to :rated_user, class_name: 'User', foreign_key: 'rated_user_id'

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|given_point|integer|null: false|
|remarks|string||

### Association
- belongs_to :user

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|product_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|reference|foreign_key: true|
|brand_name|string|null: false, unique: true|

### Association
- belongs_to :category
- has_many :products


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false, unique: true|
|ancestry|||

### Association
- has_many :brands
- has_many :products


## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|reference|foreign_key: true|
|image|string|null: false|

### Associations
- belongs_to :product


## newsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|article|text||

### Associations
- なし


## prefectureテーブル（active_hash)

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false, unique: true|

### Associations
- なし

#### 説明
都道府県名データを格納します。DBにテーブル作成せず、prefectureモデルを作成しactive_hashを使ってデータを保管します。