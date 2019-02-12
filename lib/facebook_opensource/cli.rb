class OpenSource::CLI

  def call
    puts "Welcome to our Facebook Open Source Projects CLI!"
    puts "Here are the different categories of projects: "

    #scrape categories and list them
    OpenSource::Scraper.scrape_categories
    list_categories

    #select category
    puts "Please select a category you would like to see projects of or type 'exit' to exit program."
    #ask for input, scrape projects, and list them
    get_category_input

    #ask for input, list project details
    puts "Please select a project you would like to see details of. "
    get_project_input
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

  def project_detail(project)

  end


  #clean this code up

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
      puts "Sorry, I didn't understand that command"
      get_category_input
    end
  end

  def get_project_input
    input = gets.strip
    index = input.to_i - 1
    # Need to refactor code to define index boundaries

    if index.between?(0,20)
      project = OpenSource::Project.all[index]
      puts "Name: #{project.name}"
      puts "Category: #{project.category}"
      puts "Description: #{project.description}"
    elsif input == "exit"
    else
      puts "Sorry, I didn't understand that command"
      get_project_input
    end
  end
end
