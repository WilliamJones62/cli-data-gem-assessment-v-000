require 'open-uri'
require 'pry'
require 'nokogiri'

class Scrape

  def self.champo_list

    doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_Football_League_Championship_clubs'))
#doc.css(".wikitable").css("tr").css("td").each do |team|
    doc.css(".wikitable tr").each do |row|
      team = row.css("td").first
      #the first row is headers so team will be nil
      if team != nil
  #      puts "team = #{team}"
        name = team.text
        link = team.css("a")
        profile = "https://en.wikipedia.org#{link.attr('href').text}"
  #      puts "name = #{name}"
  #      puts "profile = #{profile}"
        Team.new(name, profile)
      end
    end
  end

  def self.summary(url)
    doc = Nokogiri::HTML(open(url))
#    puts "doc2 = #{doc}"
    summary = doc.css("#mw-content-text p").text
  end

end
