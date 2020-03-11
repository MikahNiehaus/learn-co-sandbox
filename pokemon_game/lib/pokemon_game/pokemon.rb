class PokemonGame::Pokemon

attr_accessor :name, :description
@@all_names = []
@@all_descriptions = []
def initialize(name,description)
   self.name = name
   self.description = description
   @@all_names << name.to_s
   @@all_descriptions << description.to_s
end#end initialize

def self.all_names
  @@all_names
end#end all

def self.all_descriptions
  @@all_descriptions
end#end all

def self.random_pokemon
  self.all_names.sample
end#end random_pokemon

end#end class