#!/usr/bin/env perl6
unit module life_game;
use v6;

module life_game {
   sub resolve_board (Str $board) is export {
       my $result = $board;
       $result  ~~ s:g/<-[\d\.\,\*]>//;
       my @estate = split(',',$result); 
       return '' if chars(@estate[2]) < @estate[0] * @estate[1];
       return $board;
   }
}


