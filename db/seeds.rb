require_relative('../models/artist')
require_relative('../models/record')
require_relative('../models/desk')
require('pry-byebug')

Record.delete_all()
Artist.delete_all()

desk = Desk.new("1")

artist1 = Artist.new({
  'name' => 'Matrix & Futurebound'})
artist1.save()
artist2 = Artist.new({
  'name' => 'S.P.Y'})
artist2.save()
artist3 = Artist.new({
  'name' => 'High Contrast'})
artist3.save()

record1 = Record.new({
  'title' => 'Back to Basics',
  'stock' => '3',
  'artist_id' => artist2.id
  })
record2 = Record.new({
  'title' => 'High Society',
  'stock' => '10',
  'artist_id' => artist3.id
  })
record3 = Record.new({
  'title' => 'Magnetic Eyes',
  'stock' => '5',
  'artist_id' => artist1.id
  })

record1.save()
record2.save()
record3.save()

binding.pry()
nil
