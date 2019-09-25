require_relative('../db/sql_runner')
require_relative('track')
require_relative('record')


class TrackRecord

  attr_reader :id
  attr_accessor :track_id, :record_id, :track_number

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @track_id = options['track_id'].to_i
    @record_id = options['record_id'].to_i
    @track_number = options['track_number'].to_i
  end

  def save()
    sql = "INSERT INTO tracks_records
    (
    track_id, record_id, track_number
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"
    values = [@track_id, @record_id, @track_number]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tracks_records
    SET
    (track_id, record_id, track_number)
    =
    ($1, $2, $3)
    WHERE id = $4;"
    values = [@track_id, @record_id, @track_number, @id]
    SqlRunner.run(sql, values)
  end

  def track_title()
    sql = "SELECT tracks.* FROM tracks
    WHERE id = $1;"
    values = [@track_id]
    result = SqlRunner.run(sql, values)
    track = Track.new(result.first)
    return track.track_title
  end

  def record_title()
    sql = "SELECT records.* FROM records
    WHERE id = $1;"
    values = [@record_id]
    result = SqlRunner.run(sql, values)
    record = Record.new(result.first)
    return record.title
  end

  def delete()
    sql = "DELETE FROM tracks_records
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM tracks_records
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    track_record = TrackRecord.new(result)
    return track_record
  end

  def self.all()
    sql = "SELECT * FROM tracks_records;"
    results = SqlRunner.run(sql)
    return results.map { |track_record| TrackRecord.new(track_record)  }
  end

  def self.delete_all()
    sql = "DELETE FROM tracks_records;"
    SqlRunner.run(sql)
  end

end
