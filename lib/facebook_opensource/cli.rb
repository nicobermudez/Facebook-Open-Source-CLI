class OpenSource::CLI

  def call
    puts "Welcome to our Facebook Open Source Projects CLI!"
    puts "Here are the different categories of projects: "
    OpenSource::Scraper.scrape_categories
    list_categories
    puts "Please select a category you would like to see projects of or type 'exit' to exit program."
    #ask for input
    get_category_input

    #call another method
    #scrape categories
  end

  def list_categories
    OpenSource::Category.all.each_with_index do |category, index|
      puts "#{index+1}. #{category.name}"
    end
  end

  def list_projects(category)
    OpenSource::Project.all.each_with_index do |project, index|
      puts "#{index + 1}. #{project.name}"
    end
  end

  def get_category_input
    input = gets.strip
    index = input.to_i - 1
    if index.between?(0, 10)
      category = OpenSource::Category.all[index].name
      puts "#{category} Projects: "
      OpenSource::Scraper.scrape_projects(category.downcase)
      list_projects(category.downcase)
    elsif input == "exit"
      #end method
    else
      puts "Sorry, I dind't understand that command"
      get_input
    end
  end
end
