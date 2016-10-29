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
    cond = rand(0...12)
    if cond == 1
      Town.create(x:xv, y:yv, level:rand(1...7))
      puts "Town Created"
    end
    Map.create(x:xv, y:yv)
    puts "X:" + xv.to_s + "Y:" + yv.to_s
  end
end