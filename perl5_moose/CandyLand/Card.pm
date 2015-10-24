package CandyLand::Card;
use strict;
use Moose;

has color => (
	is => 'ro'
	);

has label => (
	is => 'ro'
	);

has move_count => ( 
	is => 'rw'
	); 




sub to_string {
	my $self = shift;
	#print "card: ".$self->{move_count} . " ". $self->{color} . " " . $self->{label}."\n";

	if ($self->{move_count} == 1 && $self->{color} ne "Pink") {
		return "Single $self->{color}";
	}
	elsif ($self->{move_count} == 2) {
		return "Double $self->{color}";
	}
	else {
		return "$self->{label}";
	}

}

1;