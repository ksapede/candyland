require_relative './space'

class Board
	attr_reader :board, :board_length
	def initialize
		@board_length = 0
		@board = []
		@color_index = 0
		self.add(4)
		self.add(1,"","Rainbow Trail")
		self.add(3)
		self.add(1,"Pink","Plumpy")
		self.add(8)
		self.add(1,"Pink","Mr Mint")
		self.add(15)
		self.add(1,"","Gumdrop Pass")
		self.add(8)
		self.add(1,"Pink","Jolly")
		self.add(4)
		self.add(1,"","Sticky")
		self.add(26)
		self.add(1,"Pink","Gramma Nutt")
		self.add(10)
		self.add(1,'',"Sticky")
		self.add(9) #95 spaces
		self.add(1,"Pink","Princess Lolly")
		self.add(7)
		self.add(1,'Pink','Queen Frostine')
		self.add(16)
		self.add(1,'','Sticky')
		self.add(12)
		self.add(1,'All','End')
		#puts "#{@board.length} vs #{@board_length}"
		
	end

	def add(space_count,color='',label='')
		colors = ["Red","Purple","Yellow","Blue","Orange","Green"]
		last_color = 0
		start_color = @color_index
		space_count.times do |i| 
			#print "#{@board_length} : "
			n = (i + start_color)  % 6
			if color != '' && label != ''
				@board << Space.new(color,label)
				if color != "Pink"
					@color_index = n + 1
				end
				#puts "#{color} #{label}"
			else
				@board << Space.new(colors[n],label)
				@color_index = n + 1
				#puts "#{colors[n]} #{label}"
			end
			@board_length = @board_length + 1
		end
		return last_color

	end

	def get_space_from_position(position)
		return @board[position]
	end
end