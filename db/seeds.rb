require 'json'
require 'open-uri'
require 'nokogiri'
require 'faker'
require_relative 'seed_data/countries.rb'
require_relative 'seed_data/care_instructions.rb'
require_relative 'seed_data/users.rb'

role_array = %w[admin customer]
status_array = %w[pending confirmed processing packed shipped arrived returned]
style_array = %w[modern classic casual athletic formal]
segment_array = %w[men women kids home adults girls boys]
main_category_array = %w[clothes shoes housewares]
clothing_category_array = %w[jackets shirts pants shorts dresses skirts accessories]
shoe_category_array = %w[boots trainers flats heels]
housewares_category_array = %w[kitchen hall livingroom outdoor bedroom toys decor accessories]]
category_array = %w[jackets shirts pants shorts boots trainers flats heels kitchen hall livingroom outdoor bedroom toys dresses skirts decor accessories]
color_array = %w[black white grey red orange yellow green blue indego violet multicolored]
country_array = countries
care_instructions_array = care_hash
materials_array = %w[cotton polyester wool acrylic linen spandex lycra viscose silk leather suade plastic]
tags_array = %w[eco recycleable fair-trade collectable refurbished]
user_array = users
clothing_size_array = %w[S M L XL 26 28 30 onesize]
shoe_size_array = %w[28 29 30 31 32 33 34 35 36 37 38 39 40]


## clears terminal window
system 'clear'

## adds arty farty title to terminal
puts '*' * 23
puts ' Seeding your database'
puts '*' * 23
puts '- ' * 30 + "\n"

puts "\nDestroying the database....."
sleep 2


Product.destroy_all
ProductMaterial.destroy_all
Material.destroy_all
ProductTag.destroy_all
Tag.destroy_all
ProductCareInstruction.destroy_all
CareInstruction.destroy_all
Color.destroy_all
Country.destroy_all
Brand.destroy_all
Style.destroy_all
Segment.destroy_all
MainCategory.destroy_all
Category.destroy_all
SubCategory.destroy_all
OrderProduct.destroy_all
Order.destroy_all
Status.destroy_all
User.destroy_all
Role.destroy_all
UserReview.destroy_all

puts "\nDatabase destroyed."
puts '- ' * 30 + "\n"
sleep 2


puts "\nSeeding the database....."
sleep 2

role_array.each do |role|
  Role.create!(name: role)
end
puts "    #{Role.count} 'roles' created."
sleep 1

user_array.each do |user|
  User.create!(
               first_name: user[:first_name],
               last_name: user[:last_name],
               email: user[:email],
               password: user[:password],
               user_name: user[:user_name],
               birthday: user[:birthday],
               address_line_one: user[:address_line_one],
               address_line_two: user[:address_line_two],
               city: user[:city],
               county: user[:county],
               state: user[:state],
               post_code: user[:post_code],
               country: user[:country],
               mobile_number: user[:mobile_number]
               )
end
puts "    #{User.count} 'users' created."
sleep 1

status_array.each do |status|
  Status.create!(name: status)
end
puts "    #{Status.count} 'statuses' created."
sleep 1

style_array.each do |style|
  Style.create!(name: style)
end
puts "    #{Style.count} 'styles' created."
sleep 1

segment_array.each do |segment|
  Segment.create!(name: segment)
end
puts "    #{Segment.count} 'segments' created."
sleep 1

main_category_array.each do |main_category|
  MainCategory.create!(name: main_category)
end
puts "    #{MainCategory.count} 'main categories' created."
sleep 1

category_array.each do |category|
  Category.create!(name: category)
end
puts "    #{Category.count} 'categories' created."
sleep 1

color_array.each do |color|
  Color.create!(name: color)
end
puts "    #{Color.count} 'colors' created."
sleep 1

country_array.each do |country|
  Country.create!(name: country)
end
puts "    #{Country.count} 'countries' created."
sleep 1

20.times do
  Brand.create!(name: Faker::LordOfTheRings.character)
end
puts "    #{Brand.count} 'brands' created."
sleep 1

care_instructions_array.each do |care_instruction|
  CareInstruction.create!(image: care_instruction[:image], copy: care_instruction[:copy])
end
puts "    #{CareInstruction.count} 'care instructions' created."
sleep 1

materials_array.each do |material|
  Material.create!(name: material)
end
puts "    #{Material.count} 'materials' created."
sleep 1

tags_array.each do |tag|
  Tag.create!(name: tag)
end
puts "    #{Tag.count} 'tags' created."
sleep 1

12.times do
  Product.create!(
                  name: Faker::Hipster.sentence(3) ,
                  description: Faker::Hipster.paragraph(3, false, 3),
                  price: "XXX.xx",
                  sku: Faker::Number.between(7000000000000, 8000000000000),
                  quantity: 1,
                  size: clothing_size_array.shuffle.pop,
                  product_number: Faker::Number.between(3000000, 5000000),
                  brand_id: Brand.all.sample.id,
                  country_id: Country.all.sample.id,
                  color_id: Color.all.sample.id,
                  style_id: Style.all.sample.id,
                  segment_id: Segment.all.sample.id,
                  main_category_id: MainCategory.find_by_name("clothes").id,
                  category_id: clothing_category_array.shuffle.pop
                  )
end
puts "    12 'clothing products' created."
sleep 1

12.times do
  Product.create!(
                  name: Faker::Hipster.sentence(3) ,
                  description: Faker::Hipster.paragraph(3, false, 3),
                  price: "XXX.xx",
                  sku: Faker::Number.between(7000000000000, 8000000000000),
                  quantity: 1,
                  size: shoe_size_array.shuffle.pop,
                  product_number: Faker::Number.between(3000000, 5000000),
                  brand_id: Brand.all.sample.id,
                  country_id: Country.all.sample.id,
                  color_id: Color.all.sample.id,
                  style_id: Style.all.sample.id,
                  segment_id: Segment.all.sample.id,
                  main_category_id: MainCategory.find_by_name("shoes").id,
                  category_id: shoe_category_array.shuffle.pop
                  )
end
puts "    12 'shoe products' created."
sleep 1

12.times do
  Product.create!(
                  name: Faker::Hipster.sentence(3) ,
                  description: Faker::Hipster.paragraph(3, false, 3),
                  price: "XXX.xx",
                  sku: Faker::Number.between(7000000000000, 8000000000000),
                  quantity: 1,
                  size: "onesize",
                  product_number: Faker::Number.between(3000000, 5000000),
                  brand_id: Brand.all.sample.id,
                  country_id: Country.all.sample.id,
                  color_id: Color.all.sample.id,
                  style_id: Style.all.sample.id,
                  segment_id: Segment.all.sample.id,
                  main_category_id: MainCategory.find_by_name("housewares").id,
                  category_id: housewares_category_array.shuffle.pop
                  )
end
puts "    12 'home products' created."
sleep 1

puts '- ' * 30 + "\n"
puts '*' * 23
puts ' Seeding Completed'
puts '*' * 23
