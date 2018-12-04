class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def genre=(genre)
    if genre.class == Genre
      @genre = genre
      @genre.add_song(self)
    else
      @genre = Genre.create(genre)
      @genre.add_song(self)
    end
  end

  def self.new_from_filename(filename)
    song_split = filename.gsub(".mp3", "").split(" - ")
    self.new(song_split[1],song_split[0],song_split[2])
  end

  def self.create_from_filename
  end
end
