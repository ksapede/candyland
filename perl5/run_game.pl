use strict;

use CandyLand;
my $players;
do {
	print "Number of players (4 max)?\n";

	$players = <STDIN>;
} while ($players > 4); 

my $game = CandyLand->new($players);
$game->play_game();