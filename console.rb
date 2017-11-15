require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')



artist1 = Artist.new( {
  'name' => 'Prince'
} )


artist1.save

album1_1 = Album.new( {
  'title' => 'Purple Rain',
  'genre' => 'Awesome',
  'artist_id' => artist1.id
  } )

album2_1 = Album.new( {
  'title' => 'Soul',
  'genre' => 'Awesome',
  'artist_id' => artist1.id
  } )

album1_1.save
album2_1.save

artist2 = Artist.new( {
  'name' => 'Womack & Womack'
  } )

artist2.save

album1_2 = Album.new({
  'title' => '80s',
  'genre' => 'Soul',
  'artist_id' => artist2.id
  } )

album2_2 = Album.new({
  'title' => 'Pish',
  'genre' => 'Disco',
  'artist_id' => artist2.id
  })

album1_2.save
album2_2.save

result = Album.all
result2 = Artist.all

result3 = artist2.list_albums

result4 = album2_2.list_artist

album2_1.genre = 'Rock'
album2_1.update

binding.pry
nil
