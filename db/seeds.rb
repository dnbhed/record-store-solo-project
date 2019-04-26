require_relative('../models/artist')
require_relative('../models/record')
require_relative('../models/desk')
require('pry-byebug')

Record.delete_all()
Artist.delete_all()

desk = Desk.new("1")

artist1 = Artist.new({
  'name' => 'Matrix & Futurebound'
  })

artist1.save()

record1 = Record.new({
  'title' => 'Magnetic Eyes',
  'stock' => '5',
  'artist_id' => artist1.id
  })

record1.save()

binding.pry()
nil
