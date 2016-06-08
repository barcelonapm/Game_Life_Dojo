#!/usr/bin/env perl6
unit module life_game;
use v6;

module life_game {
   sub resolve_board (Str $board) is export {
       my $result = $board;
       $result  ~~ s:g/<-[\d\.\,\*]>//;
       my @state = split(',',$result); 
       return '' if @state[0,1] ~~ /\D/;
       return '' if chars(@state[2]) < @state[0] * @state[1];
       return join(',',@state);
   }
   sub print_board (Str $board) is export {
       my $result = $board;
       $result  ~~ s:g/<-[\d\.\,\*]>//;
       my @state = split(',',$result); 
       return '' if @state[0,1] ~~ /\D/;
       return '' if chars(@state[2]) < @state[0] * @state[1];
       my $head = "(@state[0],@state[1]),\n";
       my $body ='';
       my $row = 0;
       while (++$row <= @state[0]) {
          $body ~= "\n" if $body;
          $body ~= ' 'x chars($head)-2;
          $body ~= substr(@state[2],($row-1)*@state[1],@state[1]);
       }
       return $head ~ $body;
    }

}


