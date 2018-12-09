class MusicLibraryController
extend Concerns::Findable
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")

    user_in = ""
    while user_in != "exit"
      user_in = gets
    end
  end

  def sort_class(klass, key)
    klass.all.sort_by {|object| object.send(key)}
  end

  def list_songs
    self.sort_class(Song, "name").each_with_index do |song, i|
      puts("#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}")
    end
  end

  def list_artists
    self.sort_class(Artist, "name").each_with_index do |artist, i|
      puts("#{i + 1}. #{artist.name}")
    end
  end

end
