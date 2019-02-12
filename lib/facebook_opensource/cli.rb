class OpenSource::CLI

  def call
    puts "Welcome to our Facebook Open Source Projects CLI!"
    puts ""
    #scrape categories and list them
    list_categories
    #select category
    puts "Please select a category (#) you would like to see projects of."
    #ask for input, scrape projects, and list them
    get_category_input
    #ask for input, list project details
    puts "Please select a project (#) you would like to see details of or type 'exit' to exit program. "
    get_project_input

    # TO DO: Ability to exit at any time
    # 
    # puts "Would you like to see another project? (Y/N)"
    # get_menu_input
  end

  def list_categories
    OpenSource::Scraper.scrape_categories
    puts "Here are the different categories of projects: "
    puts ""
    OpenSource::Category.all.each_with_index {|category, index| puts "#{index+1}. #{category.name}"}
    puts ""
  end

  def list_projects(category)
    OpenSource::Scraper.scrape_projects(category.downcase)
    puts "#{category.upcase} Projects: "
    puts ""
    OpenSource::Project.all.each_with_index {|project, index| puts "#{index + 1}. #{project.name}"}
    puts ""
  end

  def get_project_detail(project)
    puts ""
    puts "Name: #{project.name}"
    puts ""
    puts "Category: #{project.category.name}"
    puts ""
    puts "Description: #{project.description}"
    puts ""
    puts "GitHub: #{project.github}"
    puts ""
    puts "Website: #{project.website}"
    puts ""
  end

  def get_category_input
    input = gets.strip
    index = input.to_i - 1
    if index.between?(0, OpenSource::Category.all.length-1)
      category = OpenSource::Category.all[index].name
      list_projects(category.downcase)
    else
      puts "Sorry, I didn't understand that command"
      get_category_input
    end
  end

  def get_project_input
    input = gets.strip
    index = input.to_i - 1
    if index.between?(0,OpenSource::Project.all.length-1)
      project = OpenSource::Project.all[index]
      get_project_detail(project)

    elsif input == "exit"
      #end method
    else
      puts "Sorry, I didn't understand that command"
      get_project_input
    end
  end

  # def get_menu_input
  #   input = gets.strip
  #
  #   if input == "Y"
  #     call
  #     #TO DO: Need clear method to restart program
  #   elsif input == "N"
  #     #end
  #   else
  #     puts "Sorry, I only understand 'Y' or'N'"
  #     get_menu_input
  #   end
  # end

end
