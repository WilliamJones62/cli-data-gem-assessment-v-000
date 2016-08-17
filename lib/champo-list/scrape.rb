class Scrape

  def scrape_champo_list

    doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_Football_League_Championship_clubs/'))
    puts "doc1 = #{doc}"
    doc.css("Table.wikitable").each do |team|
      name = team.css('.name').text
      profile = "https://en.wikipedia.org#{team.attr('href')}"
      Team.new (name, profile)
    end

  def summary(url)
    doc = Nokogiri::HTML(open(url))
    puts "doc2 = #{doc}"
    summary = doc.css("h4[itemprop='name'] a[itemprop='url']")
  end

  def manager(url)
    doc = Nokogiri::HTML(open(url))
    manager = doc.css("h4[itemprop='name'] a[itemprop='url']")
  end

  def owner(url)
    doc = Nokogiri::HTML(open(url))
    owner = doc.css("h4[itemprop='name'] a[itemprop='url']")
  end

end
