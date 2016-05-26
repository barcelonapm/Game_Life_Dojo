use v6;
use Test;
use lib 'lib';
use life_game;
plan 2;

use-ok 'life_game';
 
is('5,4,....................',resolve_board('5,4,....................'),
   "An empty board returns an empty board");
