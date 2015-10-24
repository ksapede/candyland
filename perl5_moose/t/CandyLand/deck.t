#use strict;
use Test::More;
use CandyLand::Deck;
#require_ok(CandyLand::Deck);

my $deck = CandyLand::Deck->new();
#print ref $deck;

isa_ok ($deck, "CandyLand::Deck", "A deck is a Deck");

isa_ok ($deck->{deck}->[0], "CandyLand::Card", "A deck contains Cards");

my $old_first = $deck->{deck}->[0];
$deck->shuffle();
my $new_first = $deck->{deck}->[0];
is_deeply ($old_first, $new_first, "Shuffling changes the card order");

my $top_card = $deck->{deck}->[0];
my $drawn_card = $deck->draw_card();
is_deeply($top_card,$drawn_card, "draw_card draws the top card");
done_testing;

