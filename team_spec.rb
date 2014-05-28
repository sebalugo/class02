require_relative "./player.rb"
require "spec_helper.rb"

class PlayerError < RuntimeError
end

class Team
  
  attr_accessor :team_name,:team

  def initialize (team_name) 

  @team_name = team_name
  @team = []
  end

  def add_player(name,position) 
  
  element = name+" "+position
  team.each{|player| 

  if player.print_player == element 
  raise PlayerError
  end
 
  } 
   player = Player.new name,position 
   @team.push(player)
  end

  def remove_player(name,position)
    @team.delete_if { |a_player| a_player.name == name && a_player.position == position} 
  end

  def filter_by_position(position)
    array = []
    team.each {|a_player|
    if a_player.position == position
      array.push(a_player)
    end
    }
   array
    # returns players in the given position
  end
  
  def print_team 
    @team.each{|p| puts p.to_s}
  end
  
  def to_s(player)
  player.print_player 
  # output team name + players list.
  end
end


describe Team do

  describe "#initialize" do
    it "should create a new team with a team  name and an empty team" do
    team = Team.new "Ruby"
    expect(team).to be_kind_of(Team)
    expect(team).to respond_to(:team_name)
    expect(team).to respond_to(:team)
    end
  end

  describe "#team_name" do
    it "should return the name of the team and also be able to change it" do
      team = Team.new "Devs"
      expect(team.team_name).to eql("Devs")
      team.team_name = "Real Madrid"
      expect(team.team_name).to eql("Real Madrid")
    end

  end

  describe "#add_player" do

    context "player is already in the team" do
      it "should raise an error" do
        team = Team.new "El equipo"     
        team.add_player("Humberto","Medio")
        player = Player.new "HH","LL"
        expect{team.add_player("Humberto","Medio")}.to raise_error PlayerError
      end
    end

    context "player is not in the team" do
       it "should add the player to the team" do
         team = Team.new "Python"
         team.add_player("Daniel","Portero")
         team.add_player("Tur","Defensa")
         expect( team.team.any?{|ply| ply.name == "Daniel" && ply.position == "Portero"} ).to eql true
       end
    end    

  end

  describe "#remove_player" do
  
  it "should remove the given player from the team" do
  
  team = Team.new "Los Hermanos"
  team.add_player("Gilberto","Pitcher")
  team.add_player("Rigoberto","Jugador")
  team.add_player("Elias","Saltador")
  
  team.remove_player("Elias","Saltador")
  expect( team.team.any? {|ply| ply.name == "Elias" && ply.position =="Saltador"} ).to eql false 
 
  end
  
  end

  describe "filter_by_position" do
  
  it "should return an array with all the players with the given position" do
  
  team = Team.new "El equipito"
  team.add_player("Juan","Delantero")
  team.add_player("Juan","Defensa")
  team.add_player("Juan Fernando","Delantero")
  team.add_player("Jose","Defensa")
  team.add_player("Rafael","Delantero")
  position = "Delantero"
  players_array = team.filter_by_position(position)
  array = []
  players_array.each{|p| array.push(p.print_player)} 
  flag = true
  team.team.each{|p|   
  
  if p.position == position
  
  if !array.include?(p.print_player) 
    flag = false
  end  

  end 

  }
  expect(flag).to eql true
  end

  end

  describe "to_s" do

  end

end

describe Player do

  describe "#initialize" do
  
  it "should create a new player with a name and position" do
    player = Player.new "Jose","Portero"
    expect(player).to be_kind_of(Player)
    expect(player).to respond_to(:name)
    expect(player).to respond_to(:position)
    end    
   
  end
  describe "#name" do
   
    it "should return the name of the player" do
    player = Player.new "Gabriel","Pitcher"
    expect(player.name).to eql("Gabriel")
    end
  
  end

  describe "#position" do
    
    it "should return the position of the player" do
    
    player = Player.new "Fernando" ,"Defensa"
    expect(player.position).to eql("Defensa")    

    end   

  end
  
  describe "#print_player" do
    it "should return a player's name and position" do
      player = Player.new "Seba","Delantero"     
      str = player.print_player
      expect(str).to eql "Seba Delantero"
    end
  end

end

