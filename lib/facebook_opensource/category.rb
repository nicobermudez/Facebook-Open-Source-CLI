class OpenSource::Category
  attr_accessor :name

  @@all = []

  def initialize(category)
    @name = category
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
