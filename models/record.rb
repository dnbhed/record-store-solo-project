require_relative('../db/sql_runner')
require_relative('artist.rb')
require_relative('desk.rb')
require('pry-byebug')

class Record

  attr_reader :id, :title
  attr_accessor :stock, :buy_price, :sell_price, :vinyl_wav

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

  # def artist()
  #   sql = "SELECT * FROM artists
  #   WHERE id = $1;"
  #   values = [@artist_id]
  #   result = SqlRunner.run(sql, values)
  #   return Artist.new(result.first).name
  # end

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

  def delete()
      sql = "DELETE FROM records
      WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
  end

  # def self.find_all_by_artist(artist_id)
  #   sql = sql = "SELECT records.* FROM records
  #   WHERE artist_id = $1;"
  #   values = [artist_id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |record| Record.new(record) }
  # end

  def self.find(id)
    sql = "SELECT records.* FROM records
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Record.new(result.first)
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
