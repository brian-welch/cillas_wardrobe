class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :country
  belongs_to :color
  belongs_to :style
  belongs_to :segment
  belongs_to :main_category
  belongs_to :category
  belongs_to :sub_category

  has_many :materials, through: :product_materials
  has_many :tags, through: :product_tags
  has_many :care_instructions, through: :product_care_instructions
  has_many :tags, through: :product_tags
  has_many :orders, through: :order_products
  has_many :orders, through: :order_products

end
