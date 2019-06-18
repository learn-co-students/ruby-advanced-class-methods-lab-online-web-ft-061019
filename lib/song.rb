require 'pry'
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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name_to_find)
    is_found = false
    self.all.each do |song|
      if song.name == name_to_find
        is_found = song
      end
    end

    is_found
  end

  def self.find_or_create_by_name(name_to_find_or_create)
    
    is_found = self.find_by_name(name_to_find_or_create)
    action = nil

    if is_found == false || is_found == nil
      action = self.create_by_name(name_to_find_or_create) 
    else 
      action = is_found
    end
    action
  end

  def self.alphabetical
    #This would work too
    #ordered = self.all.sort { |a, b| a.name <=> b.name}
    
    #but this is more pretty and descriptive
    ordered = self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song_artist = filename.split(/[-.]/)[0].strip!
    new_song_name = filename.split(/[-.]/)[1].strip!
    new_song = self.new_by_name(new_song_name)
    new_song.artist_name = new_song_artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song_artist = filename.split(/[-.]/)[0].strip!
    new_song_name = filename.split(/[-.]/)[1].strip!
    new_song = self.create_by_name(new_song_name)
    new_song.artist_name = new_song_artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
