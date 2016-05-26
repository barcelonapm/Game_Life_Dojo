use v6;
use Test;
use lib 'lib';
use life_game;
#plan 2;

# why to do it? It must be ok we have just used it or died ???
# use-ok 'life_game';
my ($rows,$cols) = (5,5);
my $game = life_game.new(:$rows,:$cols);
say $game.perl; 
is('5,4,....................',resolve_board('5,4,....................'),
   "An empty board returns an empty board");

done-testing;
