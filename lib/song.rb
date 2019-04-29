require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name) == nil  #had to use nil over false since the array has no value
      create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    artist_nameMP3 = file_name.split(" - ").last
    song.artist_name = file_name.split(" - ").first
    song.name = artist_nameMP3.split(".").first
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    artist_nameMP3 = file_name.split(" - ").last
    song.artist_name = file_name.split(" - ").first
    song.name = artist_nameMP3.split(".").first
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# Need to be careful with what the method is doing 

#
# song1 = Song.create

# expect(song).to be_a(Song)
# expect(Song.all).to include(song)
