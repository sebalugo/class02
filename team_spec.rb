require_relative "./player.rb"
require "spec_helper.rb"

class Team
  
  attr_accessor :team_name,:team

  def initialize (team_name) 

  @team_name = team_name
  @team = []
  end

  def add_player(name,position)
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
  team.each{|a_player| a_player.print_player}
  # output team name + players list.
  end
end


describe Team do

  describe "#initialize" do

  end

  describe "#add_player" do

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
    it "should create a new player with given name and position" 
  end
  
  describe "#print_player" do
    it "should return a player's name and position" do
      player = Player.new "Seba","Delantero"     
      str = player.print_player
      expect(str).to eql "Seba Delantero"
    end

  end

end
