package CandyLand::Player;
use strict;


sub new($) {
	my $class = shift;
    my $self = {};
    bless ($self, $class);
	$self->{name} = shift;
	$self->{position} = -1;
	$self->{stuck} = 0;
	return $self;
}

1;

