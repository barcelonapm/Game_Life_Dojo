#!/usr/bin/env perl6
#unit module life_game;
use v6;

class life_game {
   has Int $.rows;
   has Int $.cols;
   
   has Bool @board[1..5,1..5]; 
   sub resolve_board (Str $board) is export {
       return $board
   }
}


