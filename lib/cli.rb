class CLI

  def run
    start
  end

  def list
    puts ""
    puts "************* English Championship Teams *************"
    puts ""
    Team.all.each.with_index(1) do |team, i|
      puts "#{i}. #{team.name}"
    end
    puts ""
    puts "What team would you like more information on, by name or number?"
    puts ""
  end

  def print_team(team)
    puts ""
    puts "-------------- #{team.name} --------------"

    puts ""
    puts team.summary
    puts ""
    puts "Enter list to see the teams again."
    puts "Enter exit to end the program."
    puts ""

  end

  def start
    Scrape.champo_list
    list
    input = nil
    while input != "exit"
      puts ""
      input = gets.strip
      if input != "exit"
        if input == "list"
          list
        elsif input.to_i == 0
          team = Team.find_by_name(input)
          if team == nil
          #bad name entered
            puts "Name not found on list!"
          else
            print_team(team)
          end
        elsif input.to_i > 0
          team = Team.find(input.to_i)
          if team == nil
          #bad name entered
            puts "Number not found on list!"
          else
            print_team(team)
          end
        end
      end
    end
    puts "Goodbye!!!"
  end
end
