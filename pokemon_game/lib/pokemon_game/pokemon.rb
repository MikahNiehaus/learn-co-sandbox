class PokemonGame::Pokemon

attr_accessor :name, :description
@@all = []

def initialize(name,description)
   self.name = name
   self.description = description
   @@all << name
end#end initialize

def self.all
  @@all
end#end all

def self.random_pokemon
  self.all.sample
  
end#end random_pokemon

end#end class