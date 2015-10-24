
use Test::More;
use Test::Random;
use CandyLand;

$ENV{TEST_RANDOM_SEED} = 100;
my $sp_game = CandyLand->new(1);
my $mp_game = CandyLand->new(3);
my $bad_game = CandyLand->new(5); #max players is 4

isa_ok($sp_game,"CandyLand","creates a Candy Land game");

is ($bad_game,undef,"Does not create games with more than 4 players");
my $number_of_players = @{$mp_game->{players}};
is ($number_of_players,3,"has a list of players");

isa_ok($sp_game->{players}->[0],"CandyLand::Player","has players");

# Onlyworks if test::random sets seed properly. :-(
my $sp_turns = $sp_game->play_game();
is ($sp_turns,36,"returns the number of rounds played when there is 1 player");

my $sp_turns = $mp_game->play_game();
is ($sp_turns,16,"returns the number of rounds played when there is 3 players");

is ($sp_game->{winner},"Red", "sets the correct winner with 1 player");
is ($mp_game->{winner},"Green","sets the correct winner with 3 players");
done_testing();
