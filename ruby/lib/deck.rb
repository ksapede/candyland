
require_relative './card'

class Deck
	attr_reader :deck
	def initialize
		
		@deck = []
		@discard = []
		["Red","Purple","Yellow","Blue","Orange","Green"].each do |i|
			6.times do 
				@deck << Card.new(i,"",1)
			end
		end
		["Red","Purple","Yellow","Blue"].each do |i|
			4.times do 
				@deck << Card.new(i,"",2)
			end
		end
		["Orange","Green"].each do |i|
			3.times do 
				@deck << Card.new(i,"",2)
			end
		end
		
		@deck << Card.new("Pink","Plumpy",1)
		@deck << Card.new("Pink","Mr Mint",1)
		@deck << Card.new("Pink","Jolly",1)
		@deck << Card.new("Pink","Gramma Nutt",1)
		@deck << Card.new("Pink","Princess Lolly",1)
		@deck << Card.new("Pink","Queen Frostine",1)
		
	end

	def shuffle
		@deck.shuffle!
		@deck.shuffle!
		@deck.shuffle!
		@deck.shuffle!
	end

	

	def draw_card
		if @deck.length == 0
			reshuffle
		end
		drawn_card = @deck.shift
		@discard << drawn_card 
		return drawn_card
	end

private

	def reshuffle
		@deck = @discard
		self.shuffle
	end

end