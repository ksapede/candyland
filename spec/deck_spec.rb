require_relative 'spec_helper'


describe Deck do
	before :each do
    	@deck = Deck.new 
	end
	describe "#new" do
		it "creates a deck" do
			expect(@deck).to be_an_instance_of Deck
		end
	end

	describe "#deck" do
		it "has cards" do
			expect(@deck.deck[0]).to be_an_instance_of Card
		end
		it "has 64 cards" do
			expect(@deck.deck.length).to be(64)
		end

	end

	describe "#shuffle" do
		it "changes the order" do
			old_first = @deck.deck[0]
			@deck.shuffle
			expect(@deck.deck[0]).not_to  be(old_first)
		end
	end

	describe "#draw_card" do 
		it "removes the top card" do
			top = @deck.deck[0]
			expect(@deck.draw_card).to be(top)
		end
	end
end