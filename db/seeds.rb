# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'eddie@visionbundles.com', name: 'Eddie', password: 'password', password_confirmation: 'password', admin: true)
User.create!(email: 'eddie2@visionbundles.com', name: 'Eddie2', password: 'password', password_confirmation: 'password')

