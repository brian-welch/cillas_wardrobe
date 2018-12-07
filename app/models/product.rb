class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :country
  belongs_to :color
  belongs_to :style
  belongs_to :segment
  belongs_to :main_category
  belongs_to :category
  belongs_to :sub_category
end
