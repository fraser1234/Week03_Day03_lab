require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name)
    VALUES($1)
    RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map{ |artist| Artist.new(artist) }
  end

  def list_albums
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |album| Album.new(album) }
  end

end
