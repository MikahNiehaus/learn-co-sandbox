#gets everything that is required
#----------------------------------------------------------
require "pry"
require 'nokogiri'
require 'open-uri'
#This is my Pokemon class and is used for everything pertaning to Pokemon
#----------------------------------------------------------#----------------------------------------------------------
class Pokemon
 attr_writer :names
@@caught_pokemon = []
@@all_pokemon = []
@@allready_updated = false
def names
  get_names
@names = @@all_pokemon
end
  def caught_pokemon=(caught_pokemon)
   # @@caught_pokemon << caught_pokemon
    @caught_pokemon = caught_pokemon
  end
  
  def caught_pokemon
    @@caught_pokemon
  end
#running this will update or return @@all_pokemon with wikipedia 
#----------------------------------------------------------  
	def get_names
	  if @@allready_updated == false
	  @@all_pokemon = []
	  count = 0
out = true
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))
doc.css('th').each do |item|
  pokemon = item.text
if out == false && pokemon.chomp != "vtePokémon species" && count == 0 
   @@all_pokemon << pokemon[1..-1].downcase
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
 @@all_pokemon.pop()
 allready_updateed = true
 else
   @@all_pokemon
 end
 
end
#this goggles the pokedex and finds the pokemon discription
#----------------------------------------------------------
def search_pokemon(pokemon_search)
 # if all_pokemon.include? pokemon_search
 pokemon_search = pokemon_search.chomp

   if pokemon_search.downcase == "mr. mime"
   pokemon_search = "mr-mime"
 elsif pokemon_search.downcase == "farfetch'd"
 pokemon_search = "farfetchd"
  elsif pokemon_search.downcase == "nidoran♀"
  pokemon_search = "nidoran-female"
  elsif pokemon_search.downcase == "nidoran♂" || pokemon_search.downcase == "nidoran"
  pokemon_search = "nidoran-male"
end
#binding.pry
  wiki_doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"+ pokemon_search.chomp))
  
pokemon_discription = wiki_doc.css('.version-y').text
pokemon_discription.chomp
#gets rid of repeating text error
new_pokemon_discription = ""
out = false
pok = pokemon_discription.split('')
count = 0
pok.each do |c|
  if out == false && c != "\n"
  new_pokemon_discription += c
end
 if c == "."
  count += 1
end
if count == 2
  out = true
end
end
count = 0
out = false
puts new_pokemon_discription
end

#this catches a new pokemon by random
#---------------------------------------------------------
def catch_pokemon
  get_names
   x = @@all_pokemon.length  
  num = rand(0...x)
 # binding.pry
new_pokemon = @@all_pokemon[num]

puts "you caught a #{new_pokemon}"
search_pokemon(new_pokemon)
@@caught_pokemon << new_pokemon

end

	 end
#I run this code whenever there is an error
#---------------------------------------------------------
def error
  puts "Input not recognized" 
end
#This creates Pokemon.new and is where the program starts
#-----------------------------------------------------------------------#-----------------------------------------------------------------------
out = false
pokemon = Pokemon.new
puts "Pokémon!"
#this is a loop so you can keep playting the game till you want to exit
while out == false
puts "List all Pokemon[1] Look at pokemon[2] Look at caught Pokemon [3] Catch Pokémon [4] Escape[e]"
input = gets.chop
#this is an if else statment that will get the useres input to run different progams in Pokemon class
if input.chomp == "1".chomp
 puts pokemon.names
 elsif input.chomp == "2".chomp
 puts "Enter pokemon's Name:"
 x = gets.chomp
 x += "\n"
 if pokemon.names.include?(x.downcase)
pokemon.search_pokemon(x)

else
  error
end
elsif input.chomp == "3".chomp
if pokemon.caught_pokemon.length != 0
puts pokemon.caught_pokemon
else
  puts "You have no pokemon"
end
elsif input.chomp == "4".chomp
pokemon.catch_pokemon
elsif input.chomp == "e".chomp
out = true
else
 error
end
end

#ruby pokemon.rb