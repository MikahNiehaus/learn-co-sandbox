#this class will scape using nakgeri
class PokemonGame::Scraper

 
  def self.nokogiri
   Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_generation_I_Pok%C3%A9mon"))
 end

   def self.scrape(location,get_id)
   output = []
      doc = nokogiri
   if get_id == true
#this gets each pokemon
doc.css(location).each do |item|
  pokemon = item.attributes["id"] 
# description = item.css('tbody tr td').text
  #this cuts out unnessesery parts of the list form wikipedia and makes sure its not added to @@all_pokemon
  if pokemon != nil
 # puts pokemon
  output << pokemon
end#pokemon if
 end#css each
else#get_id

#gets all_pokemon_description
   doc.css(location).each do |item|
 description = item.text
  #this cuts out unnessesery parts of the list form wikipedia and makes sure its not added to @@all_pokemon
  if description != nil
 # puts description
  output << description
end#description if
 end#css each
end#get_id if

output
end#scrape


end#class

#ignore this will delet later


  

