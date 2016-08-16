class ChampoList::Team
  attr_accessor :name, :url, :summary, :owner, :manager

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
    self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  def summary
  end

  def stars
  end

  def self.scrape_champo_list
    doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_Football_League_Championship_clubs/'))
    names = doc.search("h4[itemprop='name'] a[itemprop='url']")
    names.collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
  end

  def plot_summary_doc
    @plot_summary_doc ||= Nokogiri::HTML(open("#{self.url}plotsummary"))
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
