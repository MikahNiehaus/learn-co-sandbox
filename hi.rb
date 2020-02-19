class Fighter
 def initialize(name,power)
	@name = name
	@power = power
	end
attr_reader :name, :power
 
 
 def level_up
   @power += rand(1..10)
  
 end
  
end
ergo = Fighter.new("ergo",1)

puts ergo.power
ergo.level_up
puts ergo.power

  