# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|nickname|string|null: false|
|profile_description|text||
|given_name|string|null: false|
|family_name|string|null: false|
|given_name_kana|string|null: false|
|family_name_kana|string|null: false|
|mobile_number|string|null: false, unique: true|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|building|string||
|phone_number|string|null: false|

### Association
- has_many :items
- has_many :messages
- has_many :comments

# cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association

# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|string|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|
|size|string||
|brand_id|integer|foreign_key: true|
|condition|string|null: false|
|postage|string|null: false|
|shipping_method|string|null: false|
|departure_area|string|null: false|
|lead_time|string|null: false|
|display|string|null: false|
|order_status|string||

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :item_images
- has_many :comments
- has_many :messages
- has_many :likes

# item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|integer||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :items

# messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
