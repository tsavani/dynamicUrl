# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

country_list = ["http://google.com","http://twinkalsavani.blogspot.com","http://yahoo.com"]

country_list.each do |ip|
  DynamicUrl.create( url: ip)
end