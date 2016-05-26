#!/usr/bin/env perl6
#unit module life_game;
use v6;

class life_game {
   has Int $.rows;
   has Int $.cols;
   
   #has Any @.board = Array.new(:shape($!rows,$!cols));
   has Array @.board = [ (1..$!rows).map({ [ (1..$!cols).map({ False }) ] }) ];

   sub resolve_board (Str $board) is export {
       return $board
   }
}


