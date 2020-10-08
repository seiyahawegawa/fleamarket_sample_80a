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
- has_one:profiles
- has_one:credit_cards
- has_one:purrchases
- has_one:items,through
- has_many:items

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null :false, foreign_key|
|item_images_id|integer|null: false, foreign_key: true|
|item_name|string|null: false|
|item_description|text|null: false|
|category_id|integer|null: false,uniqueness: true|
|conditon_id|integer|null: false|
|shipping_charges_id|integer|null: false|
|prefecture_id|integer|null: false|
|days_to_delivery|integer|null: false|

### Association
- has_one:item_images
- has_one:purrchases
- has_one:user,through
- has_many:users
- belongs_to_active_hash:category
- belongs_to_active_hash:condition
- belongs_to_active_hash:shipping_charges
- belongs_to_active_hash:days_to_delivry
- belongs_to_active_hash:prefecture

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foregin_key|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday-year|date|null: false|
|birthday-month|date|null: false|
|birthday-day|date|null: false|
|introduction|text||

### Association
- belonges_to:user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|data|null: false|
|expiration_date_year|data|null: false|
|expiration_date_month|data|null: false|
|security_code|data|null: false|


### Association
- belonges_to: user

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belonges_to: items

## category(active_hash)テーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association
- has_many: items

## shipping_charges(active_hash)テーブル

|Column|Type|Options|
|------|----|-------|
|shipping_charges|string|null: false|

### Association
- has_many: items

## condition(active_hash)テーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_many: items

## shipping_charges(active_hash)テーブル

|Column|Type|Options|
|------|----|-------|
|shipping_charges|string|null: false|

### Association
- has_many: items

## days_to_delivery(active_hash)テーブル

|Column|Type|Options|
|------|----|-------|
|shipping_charges|string|null: false|

### Association
- has_many: items

## prefecture(active_hash)テーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

### Association
- has_many:items
- has_many:addresses

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|purrchases|references|null: false, foreign_key|
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
- belonge_to:purrchases
- belongs_to_active_hash:prefecture

## purrchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belonge_to:user
- belonge_to:item

