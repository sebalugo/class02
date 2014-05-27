class Player

attr_accessor :name,:position

def initialize name,position

@name = name
@position = position

end	

def print_player 

puts @name+" "+@position

end

end
