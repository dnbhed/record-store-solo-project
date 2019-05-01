require_relative('../db/sql_runner')
require_relative('record')
require_relative('track')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    ) VALUES
    (
      $1
    )
      RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET
    name = $1
    WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def records()
    sql = "SELECT * From records
    INNER JOIN tracks_records ON tracks_records.record_id = records.id
    INNER JOIN tracks ON tracks_records.track_id = tracks.id
    WHERE artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |record| Record.new(record)  }
  end

  def tracks()
    sql = "SELECT * FROM tracks
    WHERE artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |track| Track.new(track)}
  end

  def delete()
    if self.tracks != []
      return false
    else
      sql = "DELETE FROM artists
      WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end
  end

  def self.find(id)
    sql = "SELECT artists.* FROM artists
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result.first)
  end

  def self.all()
    sql = "SELECT artists.* FROM artists;"
    results = SqlRunner.run(sql)
    return results.map { |artist| Artist.new(artist) }
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
