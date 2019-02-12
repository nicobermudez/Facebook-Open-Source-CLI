class OpenSource::Category
  attr_accessor :name
  attr_reader :project

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
    all.detect {|c| c.name == name}
  end

end
