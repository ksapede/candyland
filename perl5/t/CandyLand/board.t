use Test::More;

use CandyLand::Board;

my $board = CandyLand::Board->new();

isa_ok($board,"CandyLand::Board","new creates a board");


isa_ok($board->{board}->[0],"CandyLand::Space","Board is made of spaces");
is ($board->{board_length},134,"Board has 134 spaces");
is ($board->{board}->[0]->{color},"Red","Board starts with a red space");
is ($board->{board}->[-1]->{color},"All","Board ends with an 'All' space");

$board->add(1);

isa_ok ($board->{board}->[-1],"CandyLand::Space","add() adds a space");

my $board = CandyLand::Board->new();
$board->add(1);
is($board->{board_length}, 135, "adds one space when passed a 1");


my $board = CandyLand::Board->new();
$board->add(3);
is($board->{board_length},137,"adds multiple spaces when passed a number > 1");

$board->add(1,'','past the end');
isnt ($board->{board}->[-1]->{color},undef,"picks a color to add if you pass blank");

$board->add(1,'Violet','nothing');
is($board->{board}->[-1]->{color},'Violet', "uses the passed color if one is passed");

$board->add(1,'Black');
isnt ($board->{board}->[-1]->{color},'Black',"Ignores the color if not also passed a label");


$space = $board->get_space_from_position(8); #plumpy
isa_ok ($space,"CandyLand::Space", "get_space_from_position returns a space");

is($space->{color},'Pink',"Returns the correct space");
done_testing();