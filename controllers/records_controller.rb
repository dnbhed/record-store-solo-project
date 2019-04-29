require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
also_reload('../models/*')

get '/records' do
  @records = Record.all()
  erb(:"records/index")
end


get '/records/new' do
  @records = Record.all()
  erb(:"records/new")
end

post '/records' do
  record.new(params).save()
  redirect to '/records'
end

get '/records/:id' do
  @record = Record.find(params['id'])
  erb(:"records/show")
end

get '/records/:id/edit' do
  @record = Record.find(params['id'])
  erb(:"records/edit")
end

post '/records/:id' do
  record = Record.new(params)
  record.update()
  redirect to "/records/#{params['id']}"
end
