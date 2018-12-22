class Product < ApplicationRecord

  # mount_uploaders :photos, PhotoUploader
  # serialize :avatars, JSON

  belongs_to :brand
  belongs_to :country
  belongs_to :color
  belongs_to :style
  belongs_to :size
  belongs_to :pattern
  belongs_to :segment
  belongs_to :main_category
  belongs_to :category
  # belongs_to :sub_category

  has_many_attached :photos

  has_many :product_materials, dependent: :destroy
  has_many :product_care_instructions, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :order_products, dependent: :destroy

  has_many :materials, through: :product_materials
  has_many :care_instructions, through: :product_care_instructions
  has_many :tags, through: :product_tags
  has_many :orders, through: :order_products

  validates :name, uniqueness: true, presence: true
  validates :size_id, presence: true
  validates :color_id, presence: true
  validates :pattern_id, presence: true
  validates :product_number, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :brand_id, presence: true
  validates :country_id, presence: true
  validates :style_id, presence: true
  validates :segment_id, presence: true
  validates :main_category_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  # validates :photos, presence: true

end
