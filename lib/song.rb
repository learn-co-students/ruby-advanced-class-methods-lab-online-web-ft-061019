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
  def self.create_by_name(song_name)
    
  end 
  def self.new_by_name(new_name)
    
  end 
  def self.find_by_name(find_name)
    
  end 
  def self.find_or_create_by_name(file_name)
    
  end 
  def self.alphabetical
    self.all.sort_by { |song| self.name}
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
