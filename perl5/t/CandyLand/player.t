use Test::More;

use CandyLand::Player;

my $player = CandyLand::Player->new("Brad");

isa_ok($player, "CandyLand::Player", "new creates a player");
is ($player->{name},"Brad","new sets the correct name");
is ($player->{position},-1,"new sets the token position to -1");
is ($player->{stuck},0,"new sets the stuck flag to false");
done_testing;