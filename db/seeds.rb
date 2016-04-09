# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
curr = User.create!(:email => "admin@communitygrows.org", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", 
:admin => true)
curr1 = User.create!(:email => "user@communitygrows.org", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", 
:admin => false)