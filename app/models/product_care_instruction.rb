class ProductCareInstruction < ApplicationRecord
  belongs_to :product
  belongs_to :care_instruction
end
