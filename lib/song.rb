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

  def self.find_by_name(name)
    is_found = false
    self.all.each do |song|
      if song.name == name 
        is_found = song
      end
    end
    is_found
  end

  def self.find_or_create_by_name(name)
    is_found = self.find_by_name(name)
    binding.pry
    if is_found == false 
      action = self.create_by_name(name) 
    else 
      action = is_found
    end
    action
  end


end
