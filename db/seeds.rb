require 'json'
require 'open-uri'
require 'nokogiri'
require 'faker'
require_relative 'seed_data/countries.rb'

role_array = %w[admin customer]
status_array = %w[pending confirmed processing packed shipped arrived returned]
style_array = %w[modern classic casual athletic formal]
segment_array = %w[men women kids home adults girls boys]
main_category_array = %w[clothes shoes housewares]
category_array = %w[jackets shirts pants shorts boots trainers flats heels kitchen hall livingroom outdoor bedroom toys dresses skirts decor accessories]
colors_array = %w[black white grey red orange yellow green blue indego violet multicolored]
country_array = countries


