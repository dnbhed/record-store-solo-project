require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
require_relative('../models/artist.rb')
require_relative('../models/track.rb')
require_relative('../models/genre.rb')
require_relative('../models/track_record.rb')
also_reload('../models/*')

get '/tracks_records' do
  @tracks_records = TrackRecord.all()
  erb(:"tracks_records/index")
end

get '/tracks_records/new' do
  @tracks_records = TrackRecord.all()
  @records = Record.all()
  @tracks = Track.all()
  erb(:"tracks_records/new")
end

post '/tracks_records' do
  TrackRecord.new(params).save()
  redirect to '/tracks_records'
end

get '/tracks_records/:id' do
  @track_record = TrackRecord.find(params['id'].to_i)
  @records = Record.all()
  @tracks = Track.all()
  erb(:"tracks_records/show")
end

get '/tracks_records/:id/edit' do
  @track_record = TrackRecord.find(params['id'])
  @records = Record.all()
  @tracks = Track.all()
  erb(:"tracks_records/edit")
end

post '/tracks_records/:id' do
  track_record = TrackRecord.new(params)
  track_record.update()
  redirect to "/tracks_records/#{params['id']}"
end

post '/tracks_records/:id/delete' do
  track_record = TrackRecord.find(params['id'])
  track_record.delete()
  redirect to '/tracks_records'
end
