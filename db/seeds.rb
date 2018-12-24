require 'json'
require 'open-uri'
require 'nokogiri'
require 'faker'
require_relative 'seed_data/countries.rb'
require_relative 'seed_data/care_instructions.rb'
require_relative 'seed_data/users.rb'
require_relative 'seed_data/three_digitizer.rb'
require_relative 'seed_data/make_prod_num.rb'

role_array = %w[admin seller customer]
status_array = %w[pending confirmed processing packed shipped arrived returned]
style_array = %w[modern classic casual athletic formal]
segment_array = %w[men women kids home adults girls boys]
main_category_array = %w[clothes shoes home]
category_array = %w[jackets shirts pants shorts boots trainers flats heels kitchen hall livingroom outdoor bedroom toys dresses skirts decor accessories]
clothing_category_array = %w[jackets shirts pants shorts dresses skirts accessories]
shoe_category_array = %w[boots trainers flats heels]
housewares_category_array = %w[kitchen hall livingroom outdoor bedroom toys decor accessories]
sub_category_array = %w[one two three]
country_array = countries
care_instructions_array = care_hash
materials_array = %w[cotton polyester wool acrylic linen spandex lycra viscose silk leather suade plastic]
tags_array = %w[eco recycleable fair-trade collectable refurbished]
user_array = users
all_sizes_array = %w[onesize XS S M L XL 2XL 3XL 0 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 10.5 11 11.5 12 12.5 13 13.5 14 14.5 15 15.5 16 16.5 17 17.5 18 18.5 19 19.5 20 20.5 21 21.5 22 22.5 23 23.5 24 24.5 25 25.5 26 26.5 27 27.5 28 28.5 29 29.5 30 30.5 31 31.5 32 32.5 33 33.5 34 34.5 35 35.5 36 36.5 37 37.5 38 38.5 39 39.5 40 40.5 41 41.5 42 42.5 43 43.5 44 44.5 45 45.5 46 46.5 47 47.5 48 48.5 49 49.5 50 52 54 56 58]
clothing_size_array = %w[XS S M L XL 26 28 30 32 34 36 onesize]
shoe_size_array = %w[28 29 30 31 32 33 34 35 36 37 38 39 40]
color_array = %w[black white grey red orange yellow green blue indego violet multicolored]
pattern_array = %w[conversational animal geometric abstract solid textured striped checked paisley flannel dotted]

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
Size.destroy_all
ProductCareInstruction.destroy_all
CareInstruction.destroy_all
Color.destroy_all
Pattern.destroy_all
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
sleep 0.5
roles_array = Role.all
user_array.each_with_index do |user, i|
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
               state: user[:state],
               post_code: user[:post_code],
               country: user[:country],
               mobile_number: user[:mobile_number],
               role_id: roles_array[i].id
               )
end
puts "    #{User.count} 'users' created."
sleep 0.5

status_array.each do |status|
  Status.create!(name: status)
end
puts "    #{Status.count} 'statuses' created."
sleep 0.5

style_array.each do |style|
  Style.create!(name: style)
end
puts "    #{Style.count} 'styles' created."
sleep 0.5

segment_array.each do |segment|
  Segment.create!(name: segment)
end
puts "    #{Segment.count} 'segments' created."
sleep 0.5

main_category_array.each do |main_category|
  MainCategory.create!(name: main_category)
end
puts "    #{MainCategory.count} 'main categories' created."
sleep 0.5

category_array.each do |category|
  Category.create!(name: category)
end
puts "    #{Category.count} 'categories' created."
sleep 0.5

sub_category_array.each do |sub_category|
  SubCategory.create!(name: sub_category)
end
puts "    #{SubCategory.count} 'sub-categories' created."
sleep 0.5

color_array.each_with_index do |color, i|
  Color.create!(
                name: color,
                code_num: three_digitizer(i)
               )
end
puts "    #{Color.count} 'colors' created."
sleep 0.5

all_sizes_array.each_with_index do |size, i|
  Size.create!(
               name: size,
               code_num: three_digitizer(i)
              )
end
puts "    #{Size.count} 'sizes' created."
sleep 0.5

pattern_array.each_with_index do |pattern, i|
  Pattern.create!(
               name: pattern,
               code_num: three_digitizer(i)
              )
end
puts "    #{Pattern.count} 'patterns' created."
sleep 0.5

country_array.each do |country|
  Country.create!(name: country)
end
puts "    #{Country.count} 'countries' created."
sleep 0.5

20.times do
  Brand.create!(name: Faker::LordOfTheRings.character)
end
puts "    #{Brand.count} 'brands' created."
sleep 0.5

care_instructions_array.each do |care_instruction|
  CareInstruction.create!(image: care_instruction[:image], copy: care_instruction[:copy])
end
puts "    #{CareInstruction.count} 'care instructions' created."
sleep 0.5

materials_array.each do |material|
  Material.create!(name: material)
end
puts "    #{Material.count} 'materials' created."
sleep 0.5

tags_array.each do |tag|
  Tag.create!(name: tag)
end
puts "    #{Tag.count} 'tags' created."
sleep 0.5

12.times do
  p_num = make_prod_num
  sku = "#{p_num}-#{rand(100..999)}-#{rand(100..999)}-#{rand(100..999)}"
  Product.create!(
                  name: Faker::Hipster.sentence(3, false, 0)[0..-2],
                  description: Faker::Hipster.paragraph(3, false, 3),
                  price: (rand(35..99) * 10),
                  sku: sku,
                  quantity: 1,
                  product_number: p_num,
                  brand_id: Brand.all.sample.id,
                  country_id: Country.all.sample.id,
                  color_id: Color.all.sample.id,
                  style_id: Style.all.sample.id,
                  segment_id: Segment.all.sample.id,
                  main_category_id: MainCategory.find_by_name("clothes").id,
                  category_id: Category.find_by_name(clothing_category_array.shuffle.pop).id,
                  sub_category_id: SubCategory.find_by_name("one").id,
                  size_id: Size.find_by_name(clothing_size_array.shuffle.pop).id,
                  pattern_id: Pattern.find_by_name(pattern_array.shuffle.pop).id,
                  live_status: true
                  )
  3.times do
    material_array = Material.all
    ProductMaterial.create!(
                            product_id: Product.last.id,
                            material_id: material_array.shuffle.pop.id,
                            percent: 33
                            )
  end

end
puts "    12 'clothing products' created."
sleep 0.5

12.times do
  p_num = make_prod_num
  sku = "#{p_num}-#{rand(100..999)}-#{rand(100..999)}-#{rand(100..999)}"
  Product.create!(
                  name: Faker::Hipster.sentence(3, false, 0)[0..-2],
                  description: Faker::Hipster.paragraph(3, false, 3),
                  price: (rand(35..99) * 10),
                  sku: sku,
                  quantity: 1,
                  product_number: p_num,
                  brand_id: Brand.all.sample.id,
                  country_id: Country.all.sample.id,
                  color_id: Color.all.sample.id,
                  style_id: Style.all.sample.id,
                  segment_id: Segment.all.sample.id,
                  main_category_id: MainCategory.find_by_name("shoes").id,
                  category_id: Category.find_by_name(shoe_category_array.shuffle.pop).id,
                  sub_category_id: SubCategory.find_by_name("two").id,
                  size_id: Size.find_by_name(shoe_size_array.shuffle.pop).id,
                  pattern_id: Pattern.find_by_name(pattern_array.shuffle.pop).id,
                  live_status: true
                  )
end
puts "    12 'shoe products' created."
sleep 0.5

12.times do
  p_num = make_prod_num
  sku = "#{p_num}-#{rand(100..999)}-#{rand(100..999)}-#{rand(100..999)}"
  Product.create!(
                  name: Faker::Hipster.sentence(3, false, 0)[0..-2],
                  description: Faker::Hipster.paragraph(3, false, 3),
                  price: (rand(35..99) * 10),
                  sku: sku,
                  quantity: 1,
                  product_number: p_num,
                  brand_id: Brand.all.sample.id,
                  country_id: Country.all.sample.id,
                  color_id: Color.all.sample.id,
                  style_id: Style.all.sample.id,
                  segment_id: Segment.all.sample.id,
                  main_category_id: MainCategory.find_by_name("home").id,
                  category_id: Category.find_by_name(housewares_category_array.shuffle.pop).id,
                  sub_category_id: SubCategory.find_by_name("three").id,
                  size_id: Size.find_by_name("onesize").id,
                  pattern_id: Pattern.find_by_name(pattern_array.shuffle.pop).id,
                  live_status: true
                  )
end
puts "    12 'home products' created."
sleep 0.5

puts '- ' * 30 + "\n"
puts '*' * 23
puts ' Seeding Completed'
puts '*' * 23
