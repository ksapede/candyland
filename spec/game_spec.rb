require_relative 'spec_helper'

describe Candyland do 
	before :all do 
		@game = Candyland.new(1)
		@game2 = Candyland.new(3)
		@turns = @game.play_game
		@turns2 = @game2.play_game
	end
	describe "#new" do 
		it "creates a game" do 
			expect(@game).to be_an_instance_of Candyland
		end
		it "has a list of players" do 
			expect(@game2.players.length).to be(3)
		end
		it "Has Players playing it" do 
			expect(@game2.players[1]).to be_an_instance_of Player
		end
	end
	describe "#play_game" do 
		# Rounds and Winners constant via srand 100 setting 
		it "returns the number of rounds played when there is 1 player" do
			expect(@turns).to eq(14)
		end
		it "returns the number of rounds played when there are multiple players" do 
			expect(@turns2).to eq(11)
		end
		it "sets a winner when there is 1 player" do 
			expect(@game.winner).to eq("Blue")
		end
		it "sets a winer when there are multiple players" do
			expect(@game2.winner).to eq("Green")
		end

	end
end