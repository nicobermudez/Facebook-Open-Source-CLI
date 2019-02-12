class OpenSource::Category
  attr_accessor :name
  attr_reader :project

  #Still not adding projects to category

  @@all = []

  def initialize(name)
    @name = name
    @projects = []
    self.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.add_projects(project)
    @projects << project
  end

  def self.find_by_name(name)
    name = name.split("-").join(" ").downcase
    all.detect {|c| c.name.downcase == name}
  end

end
