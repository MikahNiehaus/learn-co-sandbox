#.new
#instanse vs class meth..
#single responcible varuble
#creat just scraper class!
#Make sure every class does one thing
class PokemonGame::PlayPokemon
  
  def call

    
creat_pokemon

#this is a loop so you can keep playting the game till you want to exit
$out = false
$caught_pokemon = []
while $out == false
puts "List all Pokemon[1] Look at pokemon[2] Look at caught Pokemon [3] Catch Pokémon [4] Escape[e]"
input = gets.chop
#this is an if else statment that will get the useres input to run different progams in Pokemon class
if input.chomp == "1".chomp
puts PokemonGame::Pokemon.all_names
elsif input.chomp == "2".chomp
puts "Enter pokemon's Name:"
x = gets.chomp
pokemon_search(x)
elsif input.chomp == "3".chomp
if $caught_pokemon.length != 0
puts $caught_pokemon
else
  puts "You have no pokemon"
end
elsif input.chomp == "4".chomp
i = 0
random_pokemon = PokemonGame::Pokemon.random_pokemon
$caught_pokemon << random_pokemon
pokemon_search(random_pokemon)
elsif input.chomp == "e".chomp
$out = true
else
error
end

end
  end

  def pokemon_search(x)
 
    if x.chomp != ""
    my_all = PokemonGame::Pokemon.all_names
    pokemon_description = PokemonGame::Pokemon.all_descriptions
  if my_all.include?(x)
num = my_all.index(x) 

puts pokemon_description[num] + "\n"

else
  error
end
else
  puts "there is not a pokemon"
end
end
  
 def error
  puts "Input not recognized" 
end

<<<<<<< HEAD
# def nokogiri
#   Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))
# end
=======

>>>>>>> 2d8314942773e922dbd6db64ae852cdfd08dab92

def creat_pokemon

 all_pokemon_names = PokemonGame::Scraper.scrape('tbody tr th span',true)
 all_pokemon_description = PokemonGame::Scraper.scrape('tbody tr',false)
 count = 152 
  while count != -1
PokemonGame::Pokemon.new(all_pokemon_names[count],all_pokemon_description[count+2])
count -= 1
end#end while
count = 0
#puts all_pokemon_names[2]
#puts $all_pokemon_description[4]

end#creat_pokemon

<<<<<<< HEAD
  
# def scrape(location,get_id)
#   output = []
#       doc = nokogiri
#   if get_id == true
# #this gets each pokemon
# doc.css(location).each do |item|
#   pokemon = item.attributes["id"] 
# # description = item.css('tbody tr td').text
#   #this cuts out unnessesery parts of the list form wikipedia and makes sure its not added to @@all_pokemon
#   if pokemon != nil
# # puts pokemon
#   output << pokemon
# end#pokemon if
# end#css each
# else#get_id

# #gets all_pokemon_description
#   doc.css(location).each do |item|
# description = item.text
#   #this cuts out unnessesery parts of the list form wikipedia and makes sure its not added to @@all_pokemon
#   if description != nil
# # puts description
#   output << description
# end#description if
# end#css each
# end#get_id if

# output
# end#scrape
=======
>>>>>>> 2d8314942773e922dbd6db64ae852cdfd08dab92

  


end
    
    