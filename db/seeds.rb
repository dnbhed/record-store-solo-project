require_relative('../models/artist')
require_relative('../models/record')
require_relative('../models/genre')
require_relative('../models/track_record')
require_relative('../models/track')

require('pry-byebug')

Genre.delete_all()
Record.delete_all()
Artist.delete_all()

genre1 = Genre.new({
  'name' => 'DnB'
  })
genre1.save()

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
  'buy_price' => '5',
  'sell_price' => '5',
  'vinyl_wav' => 'true'
  })
record2 = Record.new({
  'title' => 'High Society',
  'stock' => '10',
  'buy_price' => '5',
  'sell_price' => '5',
  'vinyl_wav' => 'true'
  })
record3 = Record.new({
  'title' => 'Low Society',
  'stock' => '11',
  'buy_price' => '5',
  'sell_price' => '5',
  'vinyl_wav' => 'true'
  })
record4 = Record.new({
  'title' => 'Magnetic Eyes',
  'stock' => '5',
  'buy_price' => '5',
  'sell_price' => '5',
  'vinyl_wav' => 'true'
  })

record1.save()
record2.save()
record3.save()
record4.save()

binding.pry()
nil
