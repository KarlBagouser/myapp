class Item < ApplicationRecord
    has_many :orders_descriptions
    has_many :orders, through: :orders_description
    mount_uploader :image, ImageUploader

    validates :name, presence: true,  length: { maximum: 50 }
    validates :description, presence: true, length: { maximum: 200 }
    validates :price, presence: true, numericality: { only_integer: true }
end
