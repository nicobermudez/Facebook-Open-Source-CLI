class OpenSource::CLI

  def call
    #greets user
    puts ""
    puts "Welcome to our Facebook Open Source Projects CLI!"
    menu
  end

  def menu
    #scrape categories and list them
    puts " "
    list_categories
    #select category
    puts "Please select a category (#) you would like to see projects of or type 'exit' at any point to exit program."
    #ask for input, scrape projects, and list them
    get_category_input
    #ask for input, list project details
    puts "Please select a project (#) you would like to see details of or type 'exit' at any point to exit program. "
    get_project_input

    #Go again or exit
    puts "Would you like to see another project? (Y/N)"
    get_menu_input
  end



  def list_categories
    #scrape categories from website
    OpenSource::Scraper.scrape_categories if OpenSource::Category.all.empty? 
    puts "Open Source Project Categories: ".green
    puts ""
    OpenSource::Category.all.each_with_index {|category, index| puts "#{index+1}. #{category.name}".blue}
    puts ""
  end

  def list_projects(category)
    # scrape project from category from website
    OpenSource::Scraper.scrape_projects(category)
    puts ""
    puts "#{titleize(category.name)} Projects: ".green
    puts ""
    OpenSource::Project.all.each_with_index {|project, index| puts "#{index + 1}. #{project.name}".blue}
    puts ""
  end

  def get_project_detail(project)
    puts ""
    puts "#{project.name.green}"
    puts ""
    puts "  Category: ".blue + "#{project.category.name}".red
    puts ""
    puts "  Description: ".blue + "#{project.description}".red
    puts ""
    puts "  GitHub: ".blue + "#{project.github}".red
    puts ""
    puts "  Website: ".blue + "#{project.website}".red
    puts ""
  end

  def get_category_input
    input = gets.strip
    index = input.to_i - 1

    #if valid input, select category and projects from that category
    if index.between?(0, OpenSource::Category.all.length-1)
      category = OpenSource::Category.all[index]

      list_projects(category)
    elsif input.downcase == "exit"
      exit_program
    else
      puts "Sorry, I didn't understand that command"
      get_category_input
    end
  end

  def get_project_input
    input = gets.strip
    index = input.to_i - 1

    #if valid input, select project and its details
    if index.between?(0,OpenSource::Project.all.length-1)
      project = OpenSource::Project.all[index]
      get_project_detail(project)
    elsif input.downcase == "exit"
      exit_program
    else
      puts "Sorry, I didn't understand that command"
      get_project_input
    end
  end

  #repeat program or exit
  def get_menu_input
    input = gets.strip
    if input == "Y"
      menu
    elsif input == "N" || input.downcase == "exit"
      exit_program
    else
      puts "Sorry, I only understand 'Y' or 'N'"
      get_menu_input
    end
  end

  def titleize(string)
    titleized = string.split.each {|char| char.capitalize!}
    titleized = titleized.join(' ')
    titleized
  end

  def exit_program
    puts ""
    puts "Thank you for exploring Facebook's Open Source Projects! Have a nice day :)"
    puts ""
    exit
  end

end
