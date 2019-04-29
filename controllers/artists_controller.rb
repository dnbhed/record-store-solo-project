require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/record.rb')
also_reload('../models/*')

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end


get '/artists/new' do
  @artists = Artist.all()
  erb(:"artists/new")
end

post '/artists' do
  Artist.new(params).save()
  redirect to '/artists'
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:"artists/show")
end

get '/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb(:"artists/edit")
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update()
  redirect to "/artists/#{params['id']}"
end

post '/artists/:id/delete' do
  artist = Artist.find(params['id'])
  records = Record.find_all_by_artist(params['id'])
  for record in records
    record.delete
  end
  artist.delete()
  redirect to '/artists'
end
