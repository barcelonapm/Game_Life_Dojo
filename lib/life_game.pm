#!/usr/bin/env perl6
unit module life_game;
use v6;

module life_game {

   sub input_board(Str $board) {
       my $result = $board;
       $result  ~~ s:g/<-[\d\.\,\*]>//;
       my @state = split(',',$result);
      
       return (0,0,'') if 2 >=  elems @state;
       return (0,0,'') if @state[0,1] ~~ /\D/;
       return (0,0,'') if chars(@state[2]) < @state[0] * @state[1];
       $_=$_.Numeric for @state[0,1];
       return @state;
   }

   sub position(Int $row,Int $col,Int $rows,Int $cols) 
       returns Int
   {
           (($row - 1) % $rows) * $cols + ($col -1) % $cols;
   }

   sub neighbours(Int $row,Int $col,Int $rows,Int $cols) {
          (
           (($row - 2) % $rows) * $cols + ($col -2) % $cols,
           (($row - 2) % $rows) * $cols + ($col -1) % $cols,
           (($row - 2) % $rows) * $cols + $col % $cols,
           (($row - 1) % $rows) * $cols + ($col -2) % $cols,
           (($row - 1) % $rows) * $cols + $col % $cols,
           ($row % $rows) * $cols + ($col -2) % $cols,
           ($row % $rows) * $cols + ($col -1) % $cols,
           ($row % $rows) * $cols + $col % $cols)
   }

   sub live(Int $pos,Str $cels) 
       returns Bool
   {
              (substr($cels,$pos,1) eq '*') 
                  
   }

   sub lifeCount(@pos,Str $cels) 
       returns Int
   {
         my $count = 0;
         $count+=live($_,$cels)??1!!0 for @pos;
         return $count;
   }

   sub coords($pos,$rows,$cols) {
       ((($pos % ($rows*$cols)) / $cols).Int + 1 ,
        (($pos % ($rows*$cols)) % $cols) + 1)
   }

   sub resolve_board (Str $board) is export {
       my @state = input_board($board);
       return '' if @state eq (0,0,'');
       my Str $next = '';
       while (chars($next) != chars(@state[2])) {
          my ($row,$col) = coords(chars($next),@state[0],@state[1]);
          my @neighbours = neighbours($row,$col,@state[0],@state[1]);
          my $vecinity   = lifeCount(@neighbours,@state[2]);
          
          if ($vecinity == 2) {
             $next ~= live(chars($next),@state[2])?? '*' !! '.'
          } elsif ($vecinity == 3) {
             $next ~= '*';
          } else {
            $next ~= '.'
          }
       }  
       return join(',',@state[0,1],$next );
   }

   sub print_board (Str $board) is export {
       my @state = input_board($board);
       my $out = "(@state[0],@state[1]),";
       my $indent = chars($out) -1;
       my $row = 0;
       while ($row < @state[0]) {
          $out ~= "\n" ~ ' ' x $indent ~ 
                  substr(@state[2],($row++)*@state[1],@state[1]);
       }
       return $out;
    }

}


