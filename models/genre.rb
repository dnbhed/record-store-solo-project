require_relative('../db/sql_runner')

class Genre

  attr_reader :id, :bpm
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bpm = options['bpm'].to_i
  end

  def save()
    sql = "INSERT INTO genres
    (
      name, bpm
    ) VALUES
    (
      $1, $2
    )
      RETURNING id;"
    values = [@name, @bpm]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE genres
    SET
    (name, bpm) = ($1, $2)
    WHERE id = $3;"
    values = [@name, @bpm, @id]
    SqlRunner.run(sql, values)
  end



  def tracks()
    sql = "SELECT * FROM tracks
    WHERE genre_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |track| Track.new(track)}
  end

  def delete()
    if self.tracks != []
      return false
    else
      sql = "DELETE FROM genres
      WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
    end
  end

  def self.find(id)
    sql = "SELECT genres.* FROM genres
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Genre.new(result.first)
  end

  def self.all()
    sql = "SELECT genres.* FROM genres;"
    results = SqlRunner.run(sql)
    return results.map { |genre| Genre.new(genre) }
  end

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

end
