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

Mall.new(name: 'Oakridge Centre').save
Mall.new(name: 'Pacific Centre').save
Mall.new(name: 'Metropolis at Metrotown').save
Mall.new(name: 'Richmond Centre').save
Mall.new(name: 'Brentwood Town Centre').save
Mall.new(name: 'Aberdeen Centre').save
Mall.new(name: 'International Village Mall').save
Mall.new(name: 'Capilano Mall').save
Mall.new(name: 'Central City').save

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

# brentwood town centre >notworking<
#doc = Nokogiri::HTML(open("http://brentwoodtowncentre.com/centerdirectory/stores_or_services.asp", "User-Agent" => "firefox"))
#doc.css(".deftxtnoind a").each do |list_element|
#  Mall.find(5).shops.new(name: list_element.text).save
#end


# aberdeen centre
doc = Nokogiri::HTML(open("http://www.aberdeencentre.com/en/directory_stores.php?list=full&orderby=directory:name_eng&order=asc"))
doc.css("#Layer1 td:nth-child(1) a").each do |list_element|
  Mall.find(6).shops.new(name: list_element.text).save
end


# international village mall
doc = Nokogiri::HTML(open("http://www.internationalvillagemall.ca/directory/directory.php"))
doc.css("#content_left a").each do |list_element|
  Mall.find(7).shops.new(name: list_element.text).save
end


# Capilano Mall
doc = Nokogiri::HTML(open("http://www.capilanomall.com/stores/atoz.asp"))
doc.css("#main-content-wide td:nth-child(1)").each do |list_element|
  Mall.find(8).shops.new(name: list_element.text).save
end


# Central City
doc = Nokogiri::HTML(open("http://www.centralcity.ca/directory/"))
doc.css(".mapstores a").each do |list_element|
  Mall.find(9).shops.new(name: list_element.text).save
end



private
def parseAndSave (mall_id, url, selector_string)
  doc = Nokogiri::HTML(open(url))
  doc.css(selector_string).each do | element |
    Mall.find(mall_id).shops.new(name: element.text).save
  end
end

  
