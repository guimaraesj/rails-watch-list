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
require 'open-uri'
require 'json'

puts 'Cleaning up database...'
Movie.destroy_all
puts 'Database cleaned'

url = 'http://tmdb.lewagon.com/movie/top_rated'

20.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  # como testar isto acima?
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = 'https://image.tmdb.org/t/p/original'
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts 'Movies created'
