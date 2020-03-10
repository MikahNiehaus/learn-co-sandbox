class PokemonGame::Pokemon
  @@aleady_updated = false
  $out = false
  attr_writer :names, :class_name
@@caught_pokemon = []
@@all_pokemon = []


def names
  get_names
  
@names = @@all_pokemon
end
  def caught_pokemon=(caught_pokemon)
    @caught_pokemon = caught_pokemon
  end
  def self.intro
    return "Pokemon!"
  end
  def caught_pokemon
    @@caught_pokemon
  end
#running this will update @@all_pokemon with wikipedia 
#----------------------------------------------------------  
	def get_names
	  if @@aleady_updated == false
	  #first i get everything I will use
@@all_pokemon = []
count = 0
$out = true
#then I scrape the text form wikipedia
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))
#this gets each pokemon
doc.css('tbody tr').each do |item|
  pokemon = item.text
  #this cuts out unnessesery parts of the list form wikipedia and makes sure its not added to @@all_pokemon
if $out == false && pokemon.chomp != "vtePokémon species" && count == 0 
  #this adds the proper text to @@all_pokemon
  @@all_pokemon << pokemon[1..-1].downcase
  count = 1
else
  count = 0
end
if pokemon.chomp == "Secondary"
  $out = false
  elsif pokemon.chomp == "vtePokémon species"
  $out = true
end
end
$out = false
@aleady_updated=true
#this just cuts off an unnessesery thing form the list and returns what is left
@@all_pokemon.pop()
 else
   @@all_pokemom
 end
end
#this goggles the pokedex and finds the pokemon discription
#----------------------------------------------------------

#This changes some pokemon names to something that works with Nokogiri
def search_pokemon(pokemon_search)
 # if all_pokemon.include? pokemon_search
 pokemon_search = pokemon_search.chomp
   if pokemon_search.downcase == "mr. mime"
   pokemon_search = "mr-mime"
 elsif pokemon_search.downcase == "farfetch'd"
 pokemon_search = "farfetchd"
 elsif pokemon_search.downcase == "nidoran♂" 
  pokemon_search = "nidoran-male"
  elsif pokemon_search.downcase == "nidoran♀"
  pokemon_search = "nidoran-female"
end
#this uses Nokogiri to scape using the Input
  wiki_doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"+ pokemon_search.chomp))
pokemon_discription = wiki_doc.css('.version-y').text

#when you scape the web page you get extra and repeat text that this gets rid of
pokemon_discription.chomp
new_pokemon_discription = ""
$out = false
pok = pokemon_discription.split('')
count = 0
pok.each do |c|
  if $out == false && c != "\n"
  new_pokemon_discription += c
end
if c == "."
  count += 1
end
if count == 2
  $out = true
end
end
count = 0
$out = false

#the text has been fixed and it puts in the new text
puts new_pokemon_discription
end

#this catches a new pokemon by random
#---------------------------------------------------------
def catch_pokemon
  
  #this gets a random pokemon name
  get_names
  x = @@all_pokemon.length  
  num = rand(0...x)
new_pokemon = @@all_pokemon[num]

#this puts the new pokemon and its discription then adds it to your @@caught_pokemon
puts "you caught a #{new_pokemon}"
search_pokemon(new_pokemon)
@@caught_pokemon << new_pokemon

end

#just an error message
 def error
  puts "Input not recognized" 
end
end