class OpenSource::Category
  attr_accessor :name
  attr_reader :projects

  #Still not adding projects to category

  @@all = []

  def initialize(name)
    @name = name
    self.save
    @projects = []
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

  def self.find_by_name(name)
    name = name.split("-").join(" ").downcase
    all.detect {|c| c.name.downcase == name}
  end



end
