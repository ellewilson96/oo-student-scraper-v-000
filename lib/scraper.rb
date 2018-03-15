require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper


  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    students = []
    index_page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        student_location = student.css('.student-location').text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
    students
  end

  def self.scrape_profile_page(profile_url)
  student = {}
  profile_page = Nokogiri::HTML(open(profile_url))
  links = profile_page.css("div.vitals-container").each do |link|
    link.css(".social-icon-container").each do |social|
      social = "#{social.attr('href')}"
      if social.include?("linkedin")
        student[:linkedin] = social
      elsif social.include?("twitter")
        student[:twitter] = social
      elsif social.include?("github")
        student[:github] = social
      else
        student[:blog] = social
      end
end
  end
end
end
