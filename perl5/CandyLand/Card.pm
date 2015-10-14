package CandyLand::Card;
use strict;

sub new($$$) {
	my $class = shift;
	my $self = {};
	$self->{color} = shift;
	$self->{label} = shift;
	$self->{move_count} = shift;
	#print "$self->{color} $self->{label} $self->{move_count}\n";
	bless ($self,$class);


	return $self;
}

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