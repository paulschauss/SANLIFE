# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "Data destroyed"


amine = User.create!(first_name: 'Amine' last_name: 'LAFI' email: 'amine@sanlife.me', password: '123456', picture_url: 'https://avatars.githubusercontent.me/u/96190452?v=4')
puts "Amine user created"

marie = User.create!(first_name: 'Marie' last_name: 'DELORI' email: 'marie@sanlife.me', password: '123456', picture_url: 'https://avatars.githubusercontent.com/u/95865324?v=4')
puts "Marie user created"

paul = User.create!(first_name: 'Paul' last_name: 'SCHAUSS' email: 'paul@gsanlife.me', password: '123456', picture_url: 'https://avatars.githubusercontent.com/u/95611329?v=4')
puts "Paul user created"
