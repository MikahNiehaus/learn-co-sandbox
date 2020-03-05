require "pry"
require 'nokogiri'
require 'open-uri'
#----------------------------------------------------------
count = 0
#all_pokemon = []
out = true
caught_pokemon = []
#uncaught_pokemon = []
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))


#----------------------------------------------------------

class Pokemon
  attr_accessor :name
  def initialize(name)
	@name = name
end

    def ary
doc.css('th').each do |item|
  pokemon = item.text
if out == false && pokemon.chomp != "vtePokémon species" && count == 0 
   all_pokemon << pokemon[1..-1].downcase
  # uncaught_pokemon << pokemon[1..-1].downcase
   count = 1
 
 else
   count = 0
 end
 if pokemon.chomp == "Secondary"
   out = false
   elsif pokemon.chomp == "vtePokémon species"
   out = true
end
end
out = false
 all_pokemon.pop()
binding.pry
    end
    
  
end
#---------------------------------------------------------- 
all_pokemon = Pokemon.new
binding.pry
#---------------------------------------------------------
def search_pokemon(pokemon_search)
 # if all_pokemon.include? pokemon_search
   if pokemon_search.downcase! == "fr. Mime"
   pokemon_search = "mr-mime"
 elsif pokemon_search.downcase! == "farfetch'd"
 pokemon_search = "farfetchd"
 elsif pokemon_search.downcase! == "nidoran♂"
  pokemon_search = "nidoran"
  elsif pokemon_search.downcase! == "nidoran♀"
  pokemon_search = "nidoran"
end
  wiki_doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"+ pokemon_search.chomp))
pokemon_discription = wiki_doc.css('.version-y').text
puts pokemon_discription.chomp
#else
#  error
#end
end

def error
  puts "Input not recognized" 
end


 


#-----------------------------------------------------------------------


puts "Pokémon!"
while out == false
puts "List all Pokemon[1] Look at pokemon[2] Look at caught Pokemon [3] Catch Pokémon [4] Escape[e]"
input = gets
if input.chomp == "1".chomp
 puts all_pokemon
 elsif input.chomp == "2".chomp
 puts "Enter pokemon's Name:"
 x = gets
 if all_pokemon.include?(x.downcase)
search_pokemon(x)
else
  error
end

elsif input.chomp == "3".chomp
if caught_pokemon.length != 0
puts caught_pokemon
else
  puts "You have no pokemon"
end
elsif input.chomp == "4".chomp
 x = uncaught_pokemon.length  
  num = rand(0...x)
new_pokemon = uncaught_pokemon[num]
puts "you caught a #{new_pokemon}"
search_pokemon(new_pokemon)
caught_pokemon << new_pokemon
uncaught_pokemon.delete(new_pokemon)
elsif input.chomp == "e".chomp
out = true

else
 error
end
end

#ruby pokemon.rb