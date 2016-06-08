#!/usr/bin/env perl6
use v6;

sub MAIN {
    use lib 'lib';
    use life_game;
    for lines() {
        print_board($_).say;
        my $next = resolve_board($_);
        print_board($next).say ;
        $next = resolve_board($next);
        print_board($next).say ;
        $next = resolve_board($next);
        print_board($next).say ;
        $next = resolve_board($next);
        print_board($next).say ;
    }
}
     
