require_relative('../db/sql_runner')

class Artist

  def initialize( options )
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
