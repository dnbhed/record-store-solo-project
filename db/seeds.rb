require_relative('../models/artist')
require('pry-byebug')

Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Matrix'
  })

artist1.save()


binding.pry()
nil
