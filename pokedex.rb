#require 'pry'
require 'nokogiri'
require 'open-uri'
#----------------------------------------------------------
count = 0
all_pokemon = []
out = true
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))


#----------------------------------------------------------
 
  
doc.css('th').each do |item|
  pokemon = item.text
 
if out == false && pokemon.chomp != "vtePokémon species"
   all_pokemon << pokemon
   uncaught_pokemon << pokemon
 end
 if pokemon.chomp == "Secondary"
   out = false
   elsif pokemon.chomp == "vtePokémon species"
   out = true
end
end
out = false

#---------------------------------------------------------
def search_pokemon(pokemon_search)
  wiki_doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"+ pokemon_search.chomp))
pokemon_discription = wiki_doc.css('.version-y').text
puts pokemon_discription.chomp
end

def error
  puts "Input not recognized" 
end


 


#-----------------------------------------------------------------------


puts "Pokémon!"
while out == false
puts "List all Pokemon[1] Look at pokemon[2] Escape[e]"
input = gets
if input.chomp == "1".chomp
 puts all_pokemon
 elsif input.chomp == "2".chomp
 puts "Enter pokemon's English Name:"
 x = gets
search_pokemon(x)
elsif input.chomp == "e".chomp
out = true
else
 error
end
end

#ruby new.rb
