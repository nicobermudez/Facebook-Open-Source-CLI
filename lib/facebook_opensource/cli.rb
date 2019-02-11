class OpenSource::CLI

  def call
    puts "Welcome to our Facebook Open Source Projects CLI!"
    puts "Here are the different categories of projects: "
    OpenSource::Scraper.scrape_categories
    list_categories
    puts "Which category or category number would you like to see projects of?"

    #ask for input
    input = ""
    # while input != "exit"
    #   input = gets.strip
    #   case input
    #   when input == "1"
    #   when input == "2"
    #   when input == "3"
    #   when input == "4"
    #   when input == "5"
    #   when input == "6"
    #   when input == "7"
    #   when input == "8"
    #   when input == "9"
    #   when input == "10"
    #   when input == "11"
    #   end
    # end


    #call another method
    #scrape categories
  end

  def list_categories
    OpenSource::Category.all.each_with_index do |category, index|
      puts "#{index+1}. #{category.name}"
    end
  end

end
