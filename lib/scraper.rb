require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  attr_accessor :students

  def self.scrape_index_page(index_url)
    index_html = Nokogiri::HTML(open(index_url))
    students = []
    student_name = index_html.css(h4.student-name).text
    student_location = index_html.css(p.student-location).text
    student_profile_url = index_html.css(student-card.a)
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
