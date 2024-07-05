# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ['Action', 'Comedy', 'Drama', 'Horror'].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'open-uri'
# require 'json'

# # Replace 'YOUR_API_KEY' with your actual API key
# API_KEY = '7b18dac811bb30989dfc2990de6eaebf'
# API_URL = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200&api_key=#{API_KEY}'

# def fetch_movies
#   response = open(API_URL)
#   data = JSON.parse(response.read)
#   data['results']
# end

# def create_movie(movie_data)
#   Movie.create!(
#     title: movie_data['title'],
#     overview: movie_data['overview'],
#     poster_url: 'https://image.tmdb.org/t/p/w500#{movie_data['poster_path']}',
#     rating: movie_data['vote_average']
#   )
# end

# # Fetch movies from the API and seed the database
# movies = fetch_movies
# movies.each do |movie_data|
#   create_movie(movie_data) unless Movie.exists?(title: movie_data['title'])
# end

# puts '============================================='
# puts '#{movies.count} movies seeded from the API.'

# db/seeds.rb
Movie.create(title: 'Wonder Woman 1984',
             overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s',
             poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
             rating: 6.9)
Movie.create(title: 'The Shawshank Redemption',
             overview: 'Framed in the 1940s for double murder',
             poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
             rating: 8.7)
Movie.create(title: 'Titanic',
             overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.',
             poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg',
             rating: 7.9)
Movie.create(title: "Ocean's Eight",
             overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
             poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg',
             rating: 7.0)

List.create(name: 'Drama T')
List.create(name: 'Rommance T')

movie = Movie.first
list1 = List.first
list1.bookmarks.create(movie: movie, comment: 'Great action sequences!')

movie2 = Movie.last
list2 = List.last
list2.bookmarks.create(movie: movie2, comment: 'A must-watch classic!')
