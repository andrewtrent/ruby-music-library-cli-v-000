require 'pry'
class MusicImporter
  attr_accessor :path, :files

  def initialize(file_path)
    self.path = file_path
    @files = []
  end

  def files
    Dir.foreach(@path) do |x|
      if x.include?("mp3")
        @files << x
      end
    end
    @files
  end
  #binding.pry

end
