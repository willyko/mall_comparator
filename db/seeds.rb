# This file should contain all the record creation needed to seed the database with its default values.
# kogiri
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'open-uri'

# pacific centre
doc = Nokogiri::HTML(open("http://www.pacificcentre.ca/EN/directory/Pages/ListStoresA-Z.aspx"))
doc.css("#ctl00_ctl16_g_2466f160_8b42_467f_b7ea_9575a3efc65c td:nth-child(2) a").each do |list_element|                                                   
  Mall.find(2).shops.new(name: list_element.text).save
end

# oakrdige
doc = Nokogiri::HTML(open("http://www.oakridgecentre.com/store-directory"))
doc.css(".store-link").each do |list_element|                                                   
  Mall.find(1).shops.new(name: list_element.text).save
end

# metrotown
doc = Nokogiri::HTML(open("http://metropolisatmetrotown.com/our-stores"))
doc.css(".views-field-title a").each do |list_element|                                                   
  Mall.find(3).shops.new(name: list_element.text).save
end

# richmond centre
doc = Nokogiri::HTML(open("http://www.richmondcentre.com/EN/directory/Pages/ListStoresA-Z.aspx"))
doc.css("#ctl00_SPWebPartManager1_g_2466f160_8b42_467f_b7ea_9575a3efc65c td:nth-child(2) a").each do |list_element|
  Mall.find(4).shops.new(name: list_element.text).save
end

private
def parseAndSave (mall_id, url, selector_string)
  doc = Nokogiri::HTML(open(url))
  doc.css(selector_string).each do | element |
    Mall.find(mall_id).shops.new(name: element.text).save
  end
end

  
