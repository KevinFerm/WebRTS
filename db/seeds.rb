# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
map_size = 100
map_size.times do |xv|
  map_size.times do |yv|
    Map.create(x:yv, y:xv)
    puts "X:" + yv.to_s + "Y:" + xv.to_s
  end
end