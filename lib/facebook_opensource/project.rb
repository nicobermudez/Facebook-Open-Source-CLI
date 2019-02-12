class OpenSource::Project
  attr_accessor :category, :name, :github, :website, :description

  @@all = []

  #relate to category object

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

end
