class Player
	attr_reader :stuck, :position, :name
	attr_writer :stuck, :position

	def initialize(name)
		@name = name
		@position = -1
		@stuck = false
	end
end