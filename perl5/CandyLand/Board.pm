package CandyLand::Board;
use strict;

use CandyLand::Space;

sub new {
	my $class = shift;
	my $self = {};
	bless($self,$class);
	
	$self->build();
	return $self;
}

sub build {
	my $self = shift;
	$self->{board} = ();
	$self->{color_index} = 0;
	$self->{board_length} = 0;
	$self->{color_index} = 0;
	$self->add(4);
	$self->add(1,"","Rainbow Trail");
	$self->add(3);
	$self->add(1,"Pink","Plumpy");
	$self->add(8);
	$self->add(1,"Pink","Mr Mint");
	$self->add(15);
	$self->add(1,"","Gumdrop Pass");
	$self->add(8);
	$self->add(1,"Pink","Jolly");
	$self->add(4);
	$self->add(1,"","Sticky");
	$self->add(26);
	$self->add(1,"Pink","Gramma Nutt");
	$self->add(10);
	$self->add(1,'',"Sticky");
	$self->add(9); #95 spaces
	$self->add(1,"Pink","Princess Lolly");
	$self->add(7);
	$self->add(1,'Pink','Queen Frostine');
	$self->add(16);
	$self->add(1,'','Sticky');
	$self->add(12);
	$self->add(1,'All','End');

}

sub add($$$) {
	my $self = shift;
	my $space_count = shift;
	my $color = shift;
	my $label = shift;

	my @colors = ("Red","Purple","Yellow","Blue","Orange","Green");
	#my $last_color = 0;
	my $start_color = $self->{color_index};

	for my $i (1 .. $space_count) {
		my $space;
		my $n = ($i + $start_color -1) % 6;
		if ($color !~ /^\s*$/ && $label !~ /^\s*$/) {
			$space = CandyLand::Space->new($color, $label);
			push (@{$self->{board}},$space);
			#if ($color eq 'Pink') {
				#$self->{color_index} = $n + 1;
			#}
		}
		else {
			$space = CandyLand::Space->new($colors[$n],$label);
			push (@{$self->{board}},$space);
			
		}
		#print "space $self->{board_length} is $space->{color} $space->{label}\n";
		$self->{color_index} = $n + 1;
		$self->{board_length}++;
	}

	#return $last_color;

} 

sub get_space_from_position {
	my $self = shift;
	my $position = shift;
	return $self->{board}[$position];
}

1;