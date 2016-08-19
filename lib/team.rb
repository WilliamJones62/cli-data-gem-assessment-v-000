class Team
  attr_accessor :name, :url, :summary, :owner, :manager
  @@all = []

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    save
  end

  def self.team_details(team)
    team.summary = Scrape.summary(team.url)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    team = @@all[id-1]
    if team != nil
      team_details(team)
    end
    team
  end

  def self.find_by_name(name)
    team = self.all.detect do |m|
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split(" ").first.strip.downcase == name.downcase.strip
    end
    if team != nil
      team_details(team)
    end
    team
  end

end
