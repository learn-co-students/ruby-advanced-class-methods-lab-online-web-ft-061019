require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new 
    song.save 
    song
  end 
  def self.all
    @@all
  end
  def self.create_by_name(name)
    songName = self.create
    songName.name = name
    songName
  end 
  def self.new_by_name(string_fed_in_by_test)
   songObject = self.new
    songObject.name = string_fed_in_by_test
    songObject
  end 
  def self.find_by_name(find_name)
     self.all.detect {|song| song.name == find_name}
  end 
  def self.find_or_create_by_name(string_name)
    self.find_by_name(string_name) || self.create_by_name(string_name)
  end 
  def self.alphabetical
    @@all.sort_by { |song| song.name}
   end 
  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end 
  def self.create_from_filename(artist_name)
     new_song = self.new
    new_song.name = artist_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = artist_name.split(" - ")[0]
    @@all << new_song
  end 
  def self.destroy_all
    @@all.clear
  end 
  def save
    self.class.all << self
  end

end