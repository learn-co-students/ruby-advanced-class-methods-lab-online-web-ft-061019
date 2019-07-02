require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new 
    song.save 
    @@all << song
    song
  end 
  def self.all
    @@all
  end
  def self.create_by_name(name)
    songName = self.create
    songName.name = name
    songName.save 
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
    did_i_find_it = self.all.detect {|song| song.name == string_name}
    if did_i_find_it == nil
      songObj = self.new 
      songObj.name = string_name
      songObj.save 
      songObj
    else
      did_i_find_it
    end
  end 
  def self.alphabetical
    self.all.sort_by { |song| song.name}
   end 
  def self.new_from_filename(new_file)
    
  end 
  def self.create_from_filename(name)
    
  end 
  def self.destroy_all
    @@all.clear
  end 
  def save
    self.class.all << self
  end

end