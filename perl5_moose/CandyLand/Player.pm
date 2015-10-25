package CandyLand::Player;

use strict;
use Moose;


has name => (
	is => 'ro'
	);
has position => (
	is => 'rw',
	default => -1
	);
has stuck => (
	is => 'rw',
	default => 0
	);



1;

