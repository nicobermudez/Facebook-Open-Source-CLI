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
    category = category.split(" ").join("-")
    doc = Nokogiri::HTML(open("https://opensource.facebook.com/"))
    id_doc = doc.css("##{category}")
    id_doc.css("div._3eee._75ss").each do |project|
      attributes = {
        category: category.capitalize,
        name: project.css("h2").text,
        description: project.css("p").text,
        github: project.css("a._3els._y0h:first-child").attribute("href").value,
        website: project.css("a._3els._y0h:last-child").attribute("href").value
        # website: project.css("a._3els._y0h").attr("href") if project.css("a._3els._y0h").attr("href").text == "Website"
      }
      project = OpenSource::Project.new(attributes)
    end
  end
end
