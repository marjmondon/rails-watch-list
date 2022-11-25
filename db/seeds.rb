# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#  List.destroy_all

require "json"
require "rest-client"

response = RestClient.get "https://tmdb.lewagon.com/movie/top_rated"
repos = JSON.parse(response)
# => repos is an `Array` of `Hashes`.
repos["results"].each do |result|
  movie = Movie.create!(
  title: result["title"],
  overview: result["overview"],
  poster_url: "https://image.tmdb.org/t/p/w500#{result["poster_path"]}",
  rating: result["vote_average"]
)

end
