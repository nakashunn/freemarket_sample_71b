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


### users　table
|Column	|Type	|Options|
|:------|:----|:------|
|nickname |string¥null: |false	|
|family_name	|string	|null: false|
|fairst_name	|string	|null: false |
|family_name_kana	|string	|null: false|
|first_name	|string	|null: false|
|birth_year	|string	|null: false|
|birth_month	|string	|null: false|
|birth_day	|string	|null: false|
|password	|string	|null: false|
|email	|string	|null: false, unique: true|
|status	|integer	|null: false|
|deleted_at	|datetime	|null: false|

### Association
has_many :items
has_many :likes dependent: :destroy
has_many :comments dependent: :destroy
has many :messages dependent: :destroy
has many :points dependent: :destroy
has_many :social_providers dependent: :destroy
has_one :deliver_adresses dependent: :destroy
has_many :wallets dependent: :destroy
has_many :reviews dependent: :destroy
has_many :orders dependent: :destroy



### items table
|Column	|Type	|Options|
|:------|:----|:------|
|category_id	|references	|null: false, FK: true|
|shipping_id	|references	|null: false. FK: true|
|brand_id	|references	|null: false. FK: true|
|seller_user_id	|references	|null: false, FK: true|
|name	|string	|null: false|
|text	|text	|null: false|
|condition	|integer	|null: false|
|price	|integer	|null: false|
|trading_status	|integer	|null: false|
|completed_at	|datetime	|

### Association
belongs_to :user
belongs_to :category
belongs_to :brand
has_many :likes dependent: :destroy
has_many :comments dependent: :destroy
has_many :messages dependent: :destroy
has_one :shipping
has_many :reviews
has_many :item_images dependent: :destroy
has_one :order



### item_images table
|Column	|Type	|Options|
|:------|:----|:------|
|item_id	|references	|null: false, FK: true|
|image_url	|string	|null: false|

### Association
belongs_to :item


### comments table
|Column	|Type	|Options|
|:------|:----|:------|
|user_id	|references	|null: false, FK: true|
|item_id	|references	|null: false, FK: true|
|text	|text	|null: false|

### Association
belongs_to :user
belongs_to :item


### categories table
|Column	|type	|Option|
|:------|:----|:-----|
|path	|text	|null: false|
|name	|string	|null: false|
|ancestry	|string	|

### Association
has_many :brands
has_many :items
has_one :category_size
has_one :size, through: :category_size
has_one :category_brand_group
has_one :brand_group, through: :category_brand_group
has_ancestry

cards
pay.jpで実装予定