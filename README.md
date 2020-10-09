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
|email|string|null: false, foreign_key: true|
|password|string|null: false|

### Association
- has_one:profile
- has_one:credit_card
- has_many:purchases
- has_many:items

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null :false, foreign_key: true|
|item_name|string|null: false|
|item_description|text|null: false|
|category_id|integer|null: false,uniqueness: true|
|conditon_id|integer|null: false|
|shipping_charges_id|integer|null: false|
|prefecture_id|integer|null: false|
|days_to_delivery|integer|null: false|

### Association
- has_many:item_images
- has_one:purchase
- belongs_to:user
- belongs_to_active_hash:category
- belongs_to_active_hash:condition
- belongs_to_active_hash:shipping_charges
- belongs_to_active_hash:days_to_delivry
- belongs_to_active_hash:prefecture

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foregin_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|
|introduction|text||

### Association
- belonges_to:user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foregin_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|


### Association
- belongs_to: user

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to: item


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|address_first_name|string| null: false|
|address_family_name|string|null: false|
|address_first_name_kana|string|null: false|
|address_family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture_id|string|null: false|
|city|date|null: false|
|address_line|string|null: false|
|building_name|string||
|phone_number|integer|null:false,uniqueness:true|

### Association
- belongs_to:user
- belongs_to_active_hash:prefecture

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belonge_to:user
- belonge_to:item

