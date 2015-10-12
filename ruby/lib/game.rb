require_relative 'player'
require_relative 'board'
require_relative 'deck'

class Candyland
	attr_reader :players, :winner 
	#The CandlyLand game has a deck, a board

	def initialize(player_count)
		@winner = 0
		@player_count = Integer(player_count)
		@players = []
		game_peices = ["Red","Blue","Green","Yellow"]
		@player_count.times do 
			peice = game_peices.shuffle!.shift
			#puts game_peices.length
			#puts peice
			@players << Player.new(peice)
		end
		@candyland  = Board.new
		@candycards = Deck.new
		@candycards.shuffle
	end

	def play_game
		rounds = 0;
		while @winner == 0
			rounds = rounds + 1
			play_round
		end
		puts "#{@winner} wins after #{rounds}!"
		return rounds
	end

private
	
	def play_round
		@players.each do |i|
			play_turn(i)
			if i.position >= (@candyland.board_length - 1)
				@winner = i.name
				break
			end
		end
		puts  ""
	end


	def play_turn(i)
		player = i
		
		#print player.stuck
		if player.stuck == false
			card = @candycards.draw_card
			move_token(player,card)
			#puts "#{card.color}  #{card.label} #{card.direction}"
			position = player.position + 1
			puts "#{player.name} drew #{card.to_string} and moves to space #{position} which is #{@candyland.get_space_from_position(player.position).color}"
		else
			puts "#{player.name} is stuck! Skipping turn"
			player.stuck = false
		end
		
	end

	def move_token(player,card)
		stuck = false
		current_position = player.position
		card.move_count.times do |a| 
			remaining_board = []
			next_space = current_position + 1
			if card.color == "Pink"
				next_space = -1
			end
			
			#puts "starting at #{next_space}"
			remaining_board = @candyland.board[next_space,@candyland.board.length]
			
			spaces = 0
			remaining_board.length.times do |i|
				space = remaining_board[i]
				if space.color == card.color or space.color == "All"
					if space.color == "Pink" and space.label == card.label
						#puts "#{i} space is #{space.color} #{space.label}"
						spaces = i
						current_position = i
						break
					elsif space.label == "Rainbow Trail"
						current_position = current_position + i + 54 + 1
						puts "taking trail"
					elsif space.label == "Gumdrop Pass"
						current_position = current_position + i + 13 + 1
						puts "taking pass"
					elsif space.color != "Pink"
						#puts "#{i} space is #{space.color} #{space.label}"
						spaces = i
						current_position = current_position + i + 1						
						if space.label == "Sticky"
							stuck = true
						end
						break
					end
				end
			end
		end
		player.position = current_position
		player.stuck = stuck
	end

	
end