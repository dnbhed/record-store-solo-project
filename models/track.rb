require_relative('../db/sql_runner')

require('pry-byebug')


class Track

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @genre_id = options['genre_id'].to_i
    @label = options['label']
    @key = options['key']
  end

  def save()
    sql = "INSERT INTO tracks
    (
      title, artist_id, genre_id, label, key
    ) VALUES
    (
      $1, $2, $3, $4, $5
    )
      RETURNING id;"
    values = [@title, @artist_id, @genre_id, @label, @key]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tracks
    SET
    (
      title, artist_id, genre_id, label, key
    ) =
    (
      $1, $2, $3, $4, $5
    ) WHERE id = $6;"
    values = [@title, @artist_id, @genre_id, @label, @key]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tracks WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT tracks.* FROM tracks WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Record.new(result.first)
  end

  def self.all()
    sql = "SELECT tracks.* FROM tracks;"
    results = Sql_Runner.run(sql)
    return results.map { |track| Track.new(track)}
  end

  def self.delete_all()
    sql = "DELETE FROM tracks;"
    SqlRunner.run(sql)
  end

end
