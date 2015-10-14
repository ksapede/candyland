package CandyLand;
use strict;

use CandyLand::Player;
use CandyLand::Board;
use CandyLand::Deck;
use List::Util qw(shuffle);

sub new($) {
	my $class = shift;
	my $count = shift;
	return if $count > 4;
	my $self = {};
	bless($self,$class);

	$self->{winner} = "None";
	$self->{player_count} = $count;

	my @game_peices = ("Red","Blue","Green","Yellow");
	for my $i (1 .. $self->{player_count}) {
		my $peice = shift @game_peices;
		push (@{$self->{players}}, CandyLand::Player->new($peice));
	}
	$self->{board} = CandyLand::Board->new();
	
	$self->{card_deck} = CandyLand::Deck->new();
	
	return $self;

}

sub play_game {
	my $self = shift;
	my $rounds = 0;
	while ($self->{winner} eq "None") {
		$rounds++;
		$self->play_round();
		#if ($rounds > 40) {
		#	last;
		#}
	}
	print "$self->{winner} wins after $rounds!\n";
	return $rounds;

}

sub play_round {
	my $self = shift;
	foreach my $player (@{$self->{players}}) {
		$self->play_turn($player);
		if ($player->{position} >= $self->{board}->{board_length} - 1) {
			$self->{winner} = $player->{name};
			last;
		}
	}
}

sub play_turn {
	my $self = shift;
	my $player = shift;
	if ($player->{stuck} == 0) {
		my $card = $self->{card_deck}->draw_card();

		$self->move_token($player,$card);
		my $print_position = $player->{position} + 1;
		print "$player->{name} drew ".$card->to_string();
		print " and moves to space $player->{position}"; 
		print " which is ".$self->{board}->get_space_from_position($player->{position})->{color}."\n";
	}
	else {
		print "$player->{name} is stuck! Skipping turn\n";
		$player->{stuck} = 0;
	}
}

sub move_token($$) {
	my $self = shift;
	my $player = shift;
	my $card = shift;
	#print "picked $card->{color}\n";
	my $stuck = 0;
	my $current_position = $player->{position};
	for my $a (1 .. $card->{move_count}) {
		my @remaining_board;
		my $next_space = $current_position + 1;
		if ($card->{color} eq "Pink") {
			$next_space = 0;
		}

		
		my @remaining_board = @{$self->{board}->{board}};

		my $remaining_spaces = @remaining_board;
		#print "aiming for $self->{board}->{board_length}\n";
		my $spaces = 0;

		for my $i ($next_space .. $remaining_spaces) {
			my $space = $remaining_board[$i];
			#print "Trying $space->{color} $space->{label} for $card->{color} $card->{label}\n";
			if ($space->{color} eq $card->{color} || $space->{color} eq "All") {
				#print "space $i is $space->{color} which matches $card->{color}\n";
				if ($space->{color} eq "Pink" && $space->{label} eq $card->{label}) {
					$spaces = $i;
					$current_position = $i;
					last;
				}
				elsif ($space->{label} eq "Rainbow Trail") {
					$current_position = $i + 54 + 1;
					print "Taking Rainbow Trail\n";
					last;
				}
				elsif ($space->{label} eq "Gumdrop Pass") {
					$current_position = $i + 13 + 1;
					print "Taking Gumdrop Pass\n";
					last;
				}
				elsif ($space->{color} ne "Pink") {
					#$spaces = $i;
					#$current_position += $i + 1;
					$current_position = $i;
					if ($space->{label} eq 'Sticky') {
						$stuck = 1;
					}
					last;

				}
			}
		}
		$player->{position} = $current_position;
		$player->{stuck} = $stuck;

	}

}


1;

