require_relative('../models/artist')
require_relative('../models/record')
require('pry-byebug')

Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Matrix & Futurebound'
  })

artist1.save()

record1 = Record.new({
  'title' => 'Magnetic Eyes',
  'stock' => '5',
  'artist_id' => artist1.id
  })


binding.pry()
nil
