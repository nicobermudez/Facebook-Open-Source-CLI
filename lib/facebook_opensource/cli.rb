class OpenSource::CLI

  def call
    puts "Welcome to our Facebook Open Source Projects CLI!"
    puts "Here are the different categories of projects: "
    list_categories
    #ask for input
    #call another method
    #scrape categories
  end

  def list_categories
    OpenSource::Category.all.each_with_index do |category, index|
      puts "#{index}. #{category.name}"
    end
  end

end
