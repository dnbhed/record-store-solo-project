require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
require_relative('../models/artist.rb')
require_relative('../models/track.rb')
require_relative('../models/genre.rb')
also_reload('../models/*')

get '/tracks' do
  @tracks = Track.all()
  erb(:"tracks/index")
end

get '/tracks/new' do
  @tracks = Track.all()
  @artists = Artist.all()
  @genres = Genre.all()
  erb(:"tracks/new")
end

post '/tracks' do
  Track.new(params).save()
  redirect to '/tracks'
end

get '/tracks/:id' do
  @artists = Artist.all()
  @track = Track.find(params['id'])
  erb(:"tracks/show")
end

post '/tracks/:id/edit' do
  @artists = Artist.all()
  @track = Track.find(params['id'])
  @genres = Genre.all()
  erb(:"tracks/edit")
end

post '/tracks/:id' do
  track = Track.new(params)
  track.update()
  redirect to "/tracks/#{params['id']}"
end

post '/tracks/:id/delete' do
  track = Track.find(params['id'])
  track.delete()
  redirect to '/tracks'
end
