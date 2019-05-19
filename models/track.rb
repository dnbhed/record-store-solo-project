require_relative('../db/sql_runner')
require_relative('genre')


class Track

  attr_reader :id
  attr_accessor :track_title, :artist_id, :genre_id, :label, :key

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @track_title = options['track_title']
    @artist_id = options['artist_id'].to_i
    @genre_id = options['genre_id'].to_i
    @label = options['label']
    @key = options['key']
  end

  def save()
    sql = "INSERT INTO tracks
    (
      track_title, artist_id, genre_id, label, key
    ) VALUES
    (
      $1, $2, $3, $4, $5
    )
      RETURNING id;"
    values = [@track_title, @artist_id, @genre_id, @label, @key]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tracks
    SET
    (
      track_title, artist_id, genre_id, label, key
    ) =
    (
      $1, $2, $3, $4, $5
    ) WHERE id = $6;"
    values = [@track_title, @artist_id, @genre_id, @label, @key, @id]
    results = SqlRunner.run(sql, values)
  end

  def records()
    sql = "SELECT * FROM records
    INNER JOIN tracks_records tr ON tr.record_id = records.id
    WHERE tr.track_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |record| Track.new(record)}

  end

  def delete()
    if self.records != []
      return false
    else
      sql = "DELETE FROM tracks WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql,values)
    end
  end

  def genre()
    sql = "SELECT * FROM genres WHERE id = $1; "
    values = [@genre_id]
    result = SqlRunner.run(sql, values)
    genre = Genre.new(result.first)
    return genre.name
  end

  def bpm()
    sql = "SELECT * FROM genres WHERE id = $1; "
    values = [@genre_id]
    result = SqlRunner.run(sql, values)
    genre = Genre.new(result.first)
    return genre.bpm.to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1; "
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    artist = Artist.new(result.first)
    return artist.name
  end

  def self.find(id)
    sql = "SELECT tracks.* FROM tracks WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Track.new(result.first)
  end

  def self.all()
    sql = "SELECT tracks.* FROM tracks;"
    results = SqlRunner.run(sql)
    return results.map { |track| Track.new(track)}
  end

  def self.delete_all()
    sql = "DELETE FROM tracks;"
    SqlRunner.run(sql)
  end

end
