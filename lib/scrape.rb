require 'open-uri'
require 'pry'
require 'nokogiri'

class Scrape

  def self.champo_list

    doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_Football_League_Championship_clubs'))
    doc.css(".wikitable tr").each do |row|
      team = row.css("td b a").first
      puts "team 1 = #{team}"
      #the first row is headers so team will be nil
      if team != nil
        puts "team 2 = #{team}"
        name = team.text
        puts "name = #{name}"

        profile = "https://en.wikipedia.org#{team.attr('href')}"
        puts "profile = #{profile}"
        Team.new(name, profile)
      end
    end
  end

  def self.summary(url)
    doc = Nokogiri::HTML(open(url))
    summary = doc.css("#mw-content-text p").text
  end

end
