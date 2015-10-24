use Test::More;

use CandyLand::Card;

my $first_card = CandyLand::Card->new("Pink", "Mr Mint",1);
my $second_card = CandyLand::Card->new("Orange","",1);

isa_ok($first_card,"CandyLand::Card", "new creates a card");

is ($first_card->{color},"Pink", "new creates the right color card");
is ($first_card->{label},"Mr Mint","new creates a card with the right label");
is ($first_card->{move_count},1,"new creates a card with the right number of moves");

is ($first_card->to_string(),"Mr Mint", "to_string returns the expected string for character cards");
is ($second_card->to_string(),"Single Orange", "to_string returns the expected string for color cards");

done_testing();