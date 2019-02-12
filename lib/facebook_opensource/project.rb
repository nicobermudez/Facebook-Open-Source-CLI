class OpenSource::Project
  attr_accessor :name, :github, :website, :description, :category

  @@all = []

  def initialize(att_hash)
    att_hash.each {|key, value| self.send("#{key}=", value)}
    self.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

end
