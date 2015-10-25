use strict;

use CandyLand;
my $players;
#do {
	print "Number of players (4 max)?\n";

	$players = <STDIN>;
	chomp($players);
#} while ($players > 4);

print "\n\n\n$players\n\n\n\n"; 

my $game = CandyLand->new(player_count => $players);
$game->play_game();