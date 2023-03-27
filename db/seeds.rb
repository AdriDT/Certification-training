# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all

puts "Creating Movies..."
10.times do
  movie = Movie.new(
    name: Faker::Movie.title,
    year: rand(1980..2022),
    description: Faker::Lorem.paragraph(sentence_count: 6)
  )
  movie.save!
end
puts "Movies created !!"

user = User.create ()