require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/genre.rb')
require_relative('../models/track.rb')
also_reload('../models/*')

get '/genres' do
  @genres = Genre.all()
  erb(:"genres/index")
end


get '/genres/new' do
  @genres = Genre.all()
  erb(:"genres/new")
end

post '/genres' do
  Genre.new(params).save()
  redirect to '/genres'
end

get '/genres/:id' do
  @genre = Genre.find(params['id'])
  @tracks = Track.all()
  erb(:"genres/show")
end

get '/genres/:id/edit' do
  @genre = Genre.find(params['id'])
  erb(:"genres/edit")
end

post '/genres/:id' do
  genre = Genre.new(params)
  genre.update()
  redirect to "/genres/#{params['id']}"
end

post '/genres/:id/delete' do
  genre = Genre.find(params['id'])
  tracks = genre.tracks()
  for track in tracks
    track.delete
  end
  genre.delete()
  redirect to '/genres'
end
