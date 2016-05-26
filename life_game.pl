#!/usr/bin/env perl6
use v6;

sub MAIN {
    use lib 'lib';
    use life_game;
    for lines() {
        resolve_board($_).say ;
    }
}
     
