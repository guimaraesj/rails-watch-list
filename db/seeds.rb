# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed through API
# Even better, seed real movies by using this API (with open-uri and json ruby libs).
# url: https://tmdb.lewagon.com/movie/top_rated

20.times do
  new_movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Quote.most_interesting_man_in_the_world,
    poster_url: Faker::LoremFlickr.colorized_image(size: '50x60', color: 'red', search_terms: ['movies'], match_all: true),
    rating: rand(1..5)
  )
  new_movie.save!
end
