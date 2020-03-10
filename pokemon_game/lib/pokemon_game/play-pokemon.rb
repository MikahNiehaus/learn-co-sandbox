
class PokemonGame::PlayPokemon
  
  def call
    
    # awesome = PokemonGame::Awesome.new
    # awesome.get_awesome
    
#     pokemon = PokemonGame::Pokemon.new
    
# $out = false

# #this is a loop so you can keep playting the game till you want to exit
# while $out == false
# puts "List all Pokemon[1] Look at pokemon[2] Look at caught Pokemon [3] Catch Pokémon [4] Escape[e]"
# input = gets.chop
# #this is an if else statment that will get the useres input to run different progams in Pokemon class
# if input.chomp == "1".chomp
# puts pokemon.names
# elsif input.chomp == "2".chomp
# puts "Enter pokemon's Name:"
# x = gets.chomp
# x += "\n"
# if pokemon.names.include?(x.downcase)
# pokemon.search_pokemon(x)

# else
#   error
# end
# elsif input.chomp == "3".chomp
# if pokemon.caught_pokemon.length != 0
# puts pokemon.caught_pokemon
# else
#   puts "You have no pokemon"
# end
# elsif input.chomp == "4".chomp
# pokemon.catch_pokemon
# elsif input.chomp == "e".chomp
# $out = true
# else
# error
# end

# end
#   end
  
def error
  puts "Input not recognized" 
end
end
    
    