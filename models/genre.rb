require_relative('../db/sql_runner')

class Genre

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO genres
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
    sql = "UPDATE genres
    SET
    name = $1
    WHERE id = $2;"
    values = [@name, @id]
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
track
  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

end
