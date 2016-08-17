class ChampoList::Team
  attr_accessor :name, :url, :summary, :owner, :manager

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

  def self.all
    @@all ||= scrape_champo_list
  end

  def self.find(id)
    team = self.all{id-1}
  end

  def self.find_by_name(name)
    team = self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split(" ").first.strip.downcase == name.downcase.strip
    end
  end

  def summary
    @summary ||= doc.search("?").text.strip
  end

  def manager
    @manager ||= doc.search("?")text.strip)
  end

  def owner
    @owner ||= doc.search("?").text.strip)
  end

  private

    def scrape_champo_list
      doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_Football_League_Championship_clubs/'))
      puts "doc = #{doc}"
      names = doc.search("h4[itemprop='name'] a[itemprop='url']")
      names.collect{|e| new(e.text.strip, "https://en.wikipedia.org#{e.attr("href").split("?").first.strip}")}
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
