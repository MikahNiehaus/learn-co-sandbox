#require 'pry'
require 'nokogiri'
require 'open-uri'
times = 0
all_pokemon = []
 
 
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))


  out = true
  
doc.css('th').each do |item|
  pokemon = item.text
 
if out == false && pokemon.chomp != "vtePokémon species"
 puts pokemon
 
   all_pokemon << pokemon
 
 end
 if pokemon.chomp == "Secondary"
   out = false
   elsif pokemon.chomp == "vtePokémon species"
   out = true
end

end

puts "Enter pokemon"
pokemon_search = gets
if pokemon_search.chomp == "Mew"
  pokemon_search = "Mew_(Pok%C3%A9mon)"
end
wiki_doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/"+ pokemon_search.chomp))


wiki_doc.css('p').each do |peragraph|
  
  info = peragraph.text
  if times < 2
  puts info
end
  times += 1
end


times = 0
#film = gets
#ary.each do |show|
#  if show 
#end

#ruby new.rb