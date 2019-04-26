require_relative('../db/sql_runner')
require('pry-byebug')

class Record

  attr_reader :id, :title, :artist_id
  attr_accessor :stock

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @stock = options['stock'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO records
    (
      title, stock, artist_id
    ) VALUES
    (
      $1, $2, $3
    )
      RETURNING id;"
    values = [@title, @stock, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

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
    return results.map { |record| Record.new(artist) }
  end

  def self.delete_all()
    sql = "DELETE FROM records"
    SqlRunner.run(sql)
  end

end
