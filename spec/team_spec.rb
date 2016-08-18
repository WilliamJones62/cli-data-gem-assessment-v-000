require 'spec_helper'

RSpec.describe Team do
  context 'Class Methods' do

    Scrape.champo_list
    describe '.all' do
      it 'returns an array of teams' do
        expect(Team.all).to be_an(Array)
        expect(Team.all.first).to be_a(Team)
      end

      it 'correctly scrapes names and urls for the teams' do
        expect(Team.all.first.name).to eq("Aston Villa")
        expect(Team.all.first.url).to eq("https://en.wikipedia.org/wiki/Aston_Villa_F.C.")
      end
    end

    describe '.find' do
      it 'returns the team based on position in @@all' do
        expect(Team.find(1)).to eq(Team.all[0])
      end
    end

    describe '.find_by_name' do
      it 'returns the team based on the name' do
        expect(Team.find_by_name("Aston Villa")).to eq(Team.all[0])
      end
    end
  end

  context 'Instance Methods' do
    subject{Team.new("Aston Villa", "https://en.wikipedia.org/wiki/Aston_Villa_F.C.")}

    describe '#name' do
      it 'has a name' do
        expect(subject.name).to eq("Aston Villa")
      end
    end

    describe '#url' do
      it 'has a url' do
        expect(subject.url).to eq("https://en.wikipedia.org/wiki/Aston_Villa_F.C.")
      end
    end

#     describe '#owner' do
#      it 'has owner based on scraping the team URL' do
#      ??  VCR.use_cassette("team") do
#          expect(team.owner).to eq("Xia Jiantong")
#        end
#      end
#    end

#    describe '#manager' do
#      it 'has manager based on scraping the team URL' do
#      ??  VCR.use_cassette("team") do
#          expect(team.manager).to eq("Roberto Di Matteo")
#        end
#      end
#    end

#     it 'has a summary based on scraping the team URL' do
#    ??    VCR.use_cassette("plotsummary") do
#          expect(team.summary).to eq("Aston Villa Football Club (/ˈæstən ˈvɪlə/; nicknamed Villa, The Villa, The Villans, The Lions)[4] is a professional association football club based in Aston, Birmingham, that plays in the Championship, the second level of English football. Founded in 1874, they have played at their current home ground, Villa Park, since 1897. Aston Villa were the originators and founding members of the Football League in 1888. They were also founding members of the Premier League in 1992.[5] In June 2016, the club was sold by American businessman Randy Lerner to Recon Group, owned by Chinese businessman Dr Tony Jiantong Xia.")
#        end
##    end
  end
end
