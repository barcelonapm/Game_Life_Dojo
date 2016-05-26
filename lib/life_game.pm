#!/usr/bin/env perl6
#unit module life_game;
use v6;

class life_game {
   has Int $.rows is required;
   has Int $.cols is required;
   
   has Array @.board = [ (1..$!rows).map({ [ (1..$!cols).map({ [ False, True ].pick }) ] }) ];

   method live_neighbours (int $row, int $col) {
     my int $live = 0;
     $live += @.board[$row; ($col - 1) % self.cols ] ?? 1 !! 0;
     $live += @.board[$row; ($col + 1) % self.cols ] ?? 1 !! 0;
     $live += @.board[ ($row + 1) % self.rows; $col] ?? 1 !! 0;
     $live += @.board[ ($row - 1) % self.rows; $col] ?? 1 !! 0;
     return $live;
   }

   method iterate {
      
   }
}


