class Song
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name, :genre, :artist
  require 'pry'

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

  def split_name(filename)
    song_split = filename.gsub(".mp3", "").split(" - ")
  end

  def self.new_from_filename(filename)
    song_split = filename.split_name
    song = self.find_or_initialize_by_name(song_split[1])
    song.artist = song_split[0]
    song.genre = song_split[2]
    song
  end

  def self.create_from_filename
  end
end
