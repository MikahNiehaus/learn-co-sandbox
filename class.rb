require 'pry'
require 'nokogiri'
require 'open-uri'

class Pokemon
 attr_writer :names

@@caught_pokemon = []
@@all_pokemon = []
def names
  get_names
@names = @@all_pokemon
end
  
  def caught_pokemon=(caught_pokemon)
    @@caught_pokemon << caught_pokemon
    @caught_pokemon = caught_pokemon
  end
  
  def caught_pokemon
    @@caught_pokemon
  end
  
	def get_names
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
 
end
	 end
	 
	 
	class Dog
	  @@breeds = []
	 def breed=(breed)
	   @@breeds << breed
	@breed = breed
	 end
	def say_hi(txt)
	  puts txt
	  hi
	end
	def breed
	 @@breeds
	end
end	 
	 def hi
	   puts "hi"
	 end
	 
	 
if false == true
pokemon = Pokemon.new
puts pokemon.names
x = gets.chomp
pokemon.caught_pokemon << x 
x = gets.chomp
pokemon.caught_pokemon << x 
puts pokemon.caught_pokemon
else
  dog = Dog.new
 dog.say_hi("hi")
end
