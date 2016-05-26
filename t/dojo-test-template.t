use v6;
use Test;
use lib 'lib';
use life_game;
#plan 2;

# why to do it? It must be ok we have just used it or died ???
# use-ok 'life_game';
my ($rows,$cols) = (5,5);

my $game = life_game.new(
  cols => 5,
  rows => 5,
  board => [
   [ False, True, False, False, True ],
   [ True, False, False, False, False ],
   [ False, False, False, False, False ],
   [ False, False, False, False, False ],
   [ True, False, False, False, False ],
  ]);

is($game.board[1;1], False|True, 'Estamos bien inicializados?');
say $game.perl; 

ok($game.live_neighbours(1,1) == 2, '1,1: 2 live neighbours'); 
say $game.live_neighbours(0,0);
ok($game.live_neighbours(0,0) == 4, '0.0: 4 live neighbours'); 
ok($game.live_neighbours(4,4) == 2, '4,4: 2 live neighbours'); 
ok($game.live_neighbours(3,3) == 0, '3,3: 0 live neighbours'); 

$game.iterate;

($rows,$cols) = (7,7);

$game = life_game.new(:$rows,:$cols);

is($game.board[6;6], False|True, 'Estamos bien inicializados?');
say $game.perl; 

done-testing;
