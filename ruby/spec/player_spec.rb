require_relative 'spec_helper'

describe Player do
	before :all do
		@player = Player.new("Brad")
	end
	describe "#new" do
		it "creates a player" do
			expect(@player).to be_an_instance_of Player
		end
		it "sets the correct name" do
			expect(@player.name).to eq("Brad")
		end
		it "sets the token position to -1" do
			expect(@player.position).to eq(-1)
		end
		it "sets the stuck flag to false" do
			expect(@player.stuck).to be(false)
		end
	end
end