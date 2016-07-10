require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


require './db_config'
require './models/detail'
require './models/movie'



# close the database connection after every request
after do
  ActiveRecord::Base.connection.close
end


get '/' do
  erb :index
end

get '/more' do

  @more = HTTParty.get("http://www.omdbapi.com/?s=#{ params[:movie] }")['Search']

  erb :more

end

get '/about' do

if movie = Movie.find_by(name: params[:movie])
  # if movie existing in database

  # return 'movie in db'

  @movie_title = movie.name
  @movie_year = movie.year
  @movie_poster = movie.poster
  @movie_actors = movie.actors
  @movie_imbd_rating = movie.rating
  @movie_plot = movie.plot


else
  # get from api

  result = HTTParty.get("http://omdbapi.com/?t=#{ params[:movie] }")

  @movie_title = result["Title"]
  @movie_year = result['Year']
  @movie_poster = result['Poster']
  @movie_actors = result['Actors']
  @movie_imbd_rating = result["imdbRating"]
  @movie_plot = result['Plot']


  # save to db

  movie = Movie.new
  movie.name = @movie_title
  movie.year = @movie_year
  movie.poster = @movie_poster
  movie.actors = @movie_actors
  movie.rating = @movie_imdb_rating
  movie.plot = @movie_plot
  movie.save


 end


erb :about

end
