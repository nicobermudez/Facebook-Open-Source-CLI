class OpenSource::Category
  attr_accessor @name

  @@all = []

  def initialize
    @name=name
  end

  def self.all
    @@all
  end

  

end
