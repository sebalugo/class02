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

  def remove_player(name)
    @team.delete_if { |a_player| a_player.name == name} 
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

  def to_s
  team.each{|a_player| puts a_player.print_player}
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
        expect{team.add_player("Humberto","Medio")}.to raise_error PlayerError
      end
    end

    context "player is not in the team" do
       it "should add the player to the team" do

       end
    end    

  end

  describe "#remove_player" do

  end

  describe "filter_by_position" do
  
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
