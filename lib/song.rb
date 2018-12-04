class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    @genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def genre=(genre)
    genre.songs << self
  end

  def artist_equals(artist)
    ##Honestly just here to prevent an infinite loop between artist= and add_song
    @artist = artist
  end

  def artist=(artist)
    artist.add_song(self)
  end
end
