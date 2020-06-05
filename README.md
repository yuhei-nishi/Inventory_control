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

# Inventory_control DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :groups

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|
|stock|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|group|reference|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to_active_hash :category

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :user