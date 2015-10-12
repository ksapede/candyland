class Card 
	attr_reader :color, :label, :move_count
	def initialize(color,label,count)
		@color =  color
		@label = label
		@move_count = count
	end

	def to_string
		if @move_count == 1 && @color != "Pink"
			return "Single #{@color}"
		elsif @move_count == 2
			return "Double #{@color}"
		else
			return "#{@label}"
		end
	end
end