package CandyLand::Deck;
use strict;

use CandyLand::Card;
use List::Util qw(shuffle);


sub new {
	my $class = shift;
	my $self = {};
	bless($self,$class);

	$self->{deck} = [];
	$self->{discard} = [];

	$self->build_deck();
	$self->shuffle_deck();

	return $self;
}

sub build_deck {
	my $self = shift;
	for my $i (1 .. 6) {
		foreach my $color ("Red","Purple","Yellow","Blue","Orange","Green") {			
			push (@{$self->{deck}}, CandyLand::Card->new(color => $color, label =>"", move_count => 1));
		}
	}
	for my $i (1 .. 4) {
		foreach my $color ("Red","Purple","Yellow","Blue") {
			push (@{$self->{desk}},CandyLand::Card->new(color => $color, label => "", move_count => 2));
		}
	}

	for my $i (1 .. 3) {
		foreach my $color ("Orange","Green") {
			push (@{$self->{desk}},CandyLand::Card->new(color => $color, label => "", move_count => 2));
		}
	}

	push (@{$self->{deck}},CandyLand::Card->new(color => "Pink", label=> "Plumpy", move_count => 1));
	push (@{$self->{deck}},CandyLand::Card->new(color => "Pink", label=> "Mr Mint", move_count => 1));
	push (@{$self->{deck}},CandyLand::Card->new(color => "Pink", label=> "Jolly", move_count => 1));
	push (@{$self->{deck}},CandyLand::Card->new(color => "Pink", label=> "Gramma Nutt", move_count => 1));
	push (@{$self->{deck}},CandyLand::Card->new(color => "Pink", label=> "Princess Lolly", move_count => 1));
	push (@{$self->{deck}},CandyLand::Card->new(color => "Pink", label=> "Queen Frostine", move_count =>  1));
}

sub shuffle_deck {
	my $self = shift;	
	my @temp_deck = @{$self->{deck}};
	@temp_deck = shuffle @temp_deck;
	@temp_deck = shuffle @temp_deck;
	@temp_deck = shuffle @temp_deck;
	@temp_deck = shuffle @temp_deck;
	$self->{deck} = \@temp_deck;
}


sub reshuffle {
	my $self = shift;
	$self->{deck} = $self->{discard};
	$self->{discard} = ();
	$self->shuffle_deck();
}

sub draw_card {
	my $self = shift;
	my $card_count = @{$self->{deck}};
	if ($card_count == 0) {
		$self->reshuffle();
	}
	my $drawn_card = shift @{$self->{deck}};
	#print "drawing ".$drawn_card->{color};
	push (@{$self->{discard}}, $drawn_card);
	return $drawn_card;
}

1;




