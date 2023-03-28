# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all

# puts "Creating Movies..."
# 10.times do
#   movie = Movie.new(
#     title: Faker::Movie.title,
#     release_date: rand(1980..2022),
#     overview: Faker::Lorem.paragraph(sentence_count: 6)
#   )
#   movie.save!
# end
# puts "Movies created !!"

require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

movies["results"].each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'].to_f, release_date: movie['release_date'], poster: movie['poster_path'])
end