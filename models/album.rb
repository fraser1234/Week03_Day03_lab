require('pg')
require_relative('../db/sql_runner.rb')

class Album

attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING *"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{ |album| Album.new(album) }
  end

  def list_artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result[0])

  end


end
