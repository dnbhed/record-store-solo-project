require_relative('../db/sql_runner')
require_relative('artist.rb')
require_relative('track.rb')

class Record

  attr_reader :id
  attr_accessor :title, :stock, :buy_price, :sell_price, :vinyl_wav

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @stock = options['stock'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @vinyl_wav = options['vinyl_wav']
  end

  def save()
    sql = "INSERT INTO records
    (
      title, stock, buy_price, sell_price, vinyl_wav
    ) VALUES
    (
      $1, $2, $3, $4, $5
    )
      RETURNING id;"
    values = [@title, @stock, @buy_price, @sell_price, @vinyl_wav]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def tracks()
    sql = "SELECT * FROM tracks
    INNER JOIN tracks_records tr ON tr.track_id = tracks.id
    WHERE tr.record_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |track| Track.new(track)  }
  end

  def number_of_tracks()
    sql = "SELECT * FROM tracks
    INNER JOIN tracks_records tr ON tr.track_id = tracks.id
    WHERE tr.record_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.size
  end

  def update()
    sql = "UPDATE records
    SET
    (title, stock, buy_price, sell_price, vinyl_wav)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6;"
    values = [@title, @stock, @abuy_price, @sell_price, @vinyl_wav, @id]
    SqlRunner.run(sql, values)
  end

  def check_stock_level()
    result = self.stock
    if result > 10
      return "High"
    elsif result > 4
      return "Medium"
    else
      return "Low"
    end
  end

  def check_type()
    if self.vinyl_wav == 'f'
      return 'WAV'
    else
      return 'Vinyl'
    end
  end

  def check_markup()
    markup = (@sell_price - @buy_price)
    return markup
  end

  def check_potential_profit()
    potential_profit = self.check_markup * @stock
    return potential_profit
  end

  def delete()
    if self.tracks != []
      return false
    else
      sql = "DELETE FROM records
      WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end
  end

  def self.find(id)
    sql = "SELECT records.* FROM records
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Record.new(result)
  end

  def self.all()
    sql = "SELECT records.* FROM records;"
    results = SqlRunner.run(sql)
    return results.map { |record| Record.new(record) }
  end

  def self.delete_all()
    sql = "DELETE FROM records"
    SqlRunner.run(sql)
  end

end
