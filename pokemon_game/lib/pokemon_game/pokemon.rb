
class PlayPokemon::Pokemon
  $out = false
  attr_writer :names, :class_name
@@caught_pokemon = []
@@all_pokemon = []
def names
  get_names
 
@names = @@all_pokemon
end
  def caught_pokemon=(caught_pokemon)
  # @@caught_pokemon << caught_pokemon
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
	  @@all_pokemon = []
	  count = 0
$out = true
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))
doc.css('th').each do |item|
  pokemon = item.text
if $out == false && pokemon.chomp != "vtePokémon species" && count == 0 
  @@all_pokemon << pokemon[1..-1].downcase
  # uncaught_pokemon << pokemon[1..-1].downcase
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
@@all_pokemon.pop()
 
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
elsif pokemon_search.downcase == "nidoran♂"
  pokemon_search = "nidoran"
  elsif pokemon_search.downcase == "nidoran♀"
  pokemon_search = "nidoran"
end
  wiki_doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"+ pokemon_search.chomp))
pokemon_discription = wiki_doc.css('.version-y').text
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