require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  attr_accessor :students

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    student_name = doc.css("card-text-container.h4.student-name").text
    student_location = doc.css("p student-location").text
    student_profile_url = doc.css("a student-card")
    students << {name: student_name,
    location: student_location,
    profile_url: student_profile_url}
    students
end

  def self.scrape_profile_page(profile_url)
  student = {}
  profile_page = Nokogiri::HTML(open(profile_slug))

  end

end
