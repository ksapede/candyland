use Test::More;
use CandyLand::Space;

my $first_space = CandyLand::Space->new("Blue");
my $second_space = CandyLand::Space->new("Orange", "Sticky");

isa_ok($first_space,"CandyLand::Space", "new returns an instance of space");
is ($first_space->{color}, "Blue", "new sets the right color when passed only a color");
is ($second_space->{color}, "Orange","new sets the right color when passed both a space and a label");
is ($first_space->{label},undef, "new sets no label if passed nothing");
is ($second_space->{label},"Sticky","new sets a label when one is passed");
done_testing();