class Team
  
  attr_reader :team_name

  def initialize (team_name) 

  @team_name = team_name
  team = []
  end

  def add_player(name, position)
   Player player = Player.new name,postion
   team.push(player)
  end

  def remove_player(name)
    team.delete_if { |a_player| a_player.name == name} 
  end

  def filter_by_position(position)
    # returns players in the given position
  end

  def to_s
 # output team name + players list.
  end
end
