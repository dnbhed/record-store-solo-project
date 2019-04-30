require_relative('../models/artist')
require_relative('../models/record')
require_relative('../models/genre')
require_relative('../models/track_record')
require_relative('../models/track')

require('pry-byebug')

TrackRecord.delete_all()
Track.delete_all()
Genre.delete_all()
Record.delete_all()
Artist.delete_all()

genre1 = Genre.new({
  'name' => 'DnB',
  'bpm' => '174'
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

track1 = Track.new({
  'title' => 'Days Go By',
  'artist_id' => artist3.id,
  'genre_id' => genre1.id,
  'label' => 'Hospital Records',
  'key' => '4A'
  })
track1.save()
track2 = Track.new({
  'title' => 'Days Go By',
  'artist_id' => artist3.id,
  'genre_id' => genre1.id,
  'label' => 'Hospital Records',
  'key' => '4A'
  })
track2.save()
track3 = Track.new({
  'title' => 'Back to Basics',
  'artist_id' => artist2.id,
  'genre_id' => genre1.id,
  'label' => 'Hospital Records',
  'key' => '4A'
  })
track3.save()

track_record1 = TrackRecord.new({
  'track_id' => track1.id,
  'record_id' => record2.id,
  'track_number' => '1'
  })
track_record2 = TrackRecord.new({
  'track_id' => track2.id,
  'record_id' => record1.id,
  'track_number' => '1'
  })
track_record1.save()
track_record2.save()

binding.pry()
nil
