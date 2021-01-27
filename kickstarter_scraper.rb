# require libraries/modules here
require 'nokogiri'
require 'pry'

  # projects: kickstarter.css("li.project.grid_4")
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text 
  # location: project.css("ul.project-meta span.location-name").text
  # percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i 

def create_project_hash
  # write your code here

  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  # binding.pry

  Hash.new.tap {|projects|
    kickstarter.css("li.project.grid_4").each {|project| 
      title = project.css("h2.bbcard_name strong a").text
      projects[title.to_sym] = {
          :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
          :description => project.css("p.bbcard_blurb").text,
          :location => project.css("ul.project-meta span.location-name").text,
          :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
      }
    }
    # kickstarter.css("li.project.grid_4").each {|project|
    #   title = project.css("h2 strong a").text.strip
    #   projects[title.to_sym] = {
    #     image_link: project.css(".project-thumnail a img").attribute("src").value,
    #     description: project.css("p.bbcard_blurb").text.strip,
    #     location: project.css(".project-meta span.location-name"),
    #     percent_funded: project.css("project-stats li strong").text.strip.gsub("%", "").to_i
    #   }
    # }
  }
  

  # projects = {}

  # kickstarter.css("li.project.grid_4").each {|project| 
  #   title = project.css("h2.bbcard_name strong a").text
  #   projects[title.to_sym] = {
  #     :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
  #     :description => project.css("p.bbcard_blurb").text,
  #     :location => project.css("ul.project-meta span.location-name").text,
  #     :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
  #   }
  # }
  # binding.pry
  # p projects
end

create_project_hash