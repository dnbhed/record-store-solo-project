require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd1j4m54eik8k4l', host: 'ec2-174-129-208-118.compute-1.amazonaws.com', user: 'knhrxndktlsqkx', password: '64247f23c4330f871c9dc862ab2aff05a83e7df44c07a88050e12099c7e354d0' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
