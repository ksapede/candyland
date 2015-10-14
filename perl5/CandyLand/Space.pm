package CandyLand::Space;
use strict;

sub new($$) {
	my $class = shift;
	my $self = {};
	bless ($self,$class);
	$self->{color} = shift;
	$self->{label} = shift;
	return $self;
}

1;