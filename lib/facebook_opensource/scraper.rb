class OpenSource::Scraper

  def self.scrape_categories
    puts "**Scraping Categories**"
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
    puts "**Scraping Projects**"
    category_name = category.name.split(" ").join("-").downcase
    doc = Nokogiri::HTML(open("https://opensource.facebook.com/"))

    #select html from only specific category from ID
    id_doc = doc.css("##{category_name}")
    id_doc.css("div._3eee._75ss").each do |project|

      attributes = {
        name: project.css("h2").text,
        #Reference existing Category Object
        category: category,
        description: project.css("p").text,
        github: project.css("a._3els._y0h:first-child").attribute("href").value,
        website: project.css("a._3els._y0h:last-child").attribute("href").value
      }

      project = OpenSource::Project.new(attributes)
      category.projects << project
    end
  end
end
