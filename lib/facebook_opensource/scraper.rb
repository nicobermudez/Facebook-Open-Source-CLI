class OpenSource::Scraper

  def self.scrape_categories
    doc = Nokogiri::HTML(open("https://opensource.facebook.com/"))
    categories = []
    doc.css("div._4v8d._6u4h").each do |section|
      if section.css("h1").text != "Trending"
        category_name= section.css("h1").text
        categories << {category: category_name}
        category = OpenSource::Category.new(category_name)
      end
    end


  end

  def self.scrape_projects(category)
    doc = Nokogiri::HTML(open(category))
    project = {}

  end

end
