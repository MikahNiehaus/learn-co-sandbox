 class Pokemon
 attr_writer :names,:name
attr_reader :names
#	 def name=(name)
#	@name = name
#	 end

	def name
	 @name = ["Erogo","Pino","Cognito"]
end
	 end

pokemon = Pokemon.new
#pokemon.names=x

puts pokemon.name