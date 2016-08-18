class CLI

  def run
    start
  end

  def list
    puts ""
    puts "************* English Championship Teams *************"
    puts ""
    Scrape.champo_list
    Team.all.each.with_index(1) do |team, i|
      puts "#{i}. #{team.name}"
    end
    puts ""
  end

  def print_team(team)
    puts ""
    puts "-------------- #{team.name} --------------"

    puts ""
    puts team.summary
    puts ""

    puts "Owner: #{team.owner}"
    puts ""

    puts "Manager: #{team.manager}"
    puts ""
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What team would you more information on, by name or number?"
      puts ""
      puts "Enter list to see the teams again."
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if team = Team.find_by_name(input)
          print_team(team)
        end
      elsif input.to_i > 0
        if team = Team.find(input.to_i)
          print_team(team)
        end
      end
    end
    puts "Goodbye!!!"
  end
end
