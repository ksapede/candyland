package CandyLand::Space;
use Moose;
use Moose::Util::TypeConstraints;

use strict;



has 'color' => (
	is => 'ro',
	isa => 'Str',
	#required => 1
	);

subtype 'MaybeEmptyStr', 
	as 'Str';
coerce 'MaybeEmptyStr',
   from 'Undef',
      via { '' };


has 'label' => (
	is => 'ro',
	isa => 'MaybeEmptyStr',
	required => 0,
	coerce => 1,
	);

1;