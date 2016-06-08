use v6;
use Test;
use lib 'lib';
use life_game;
#plan 2;

# why to do it? It must be ok we have just used it or died ???
# use-ok 'life_game';
 
is(resolve_board('5,4,....................'),'5,4,....................',
   "An empty board returns an empty board");
is(resolve_board('5,4,.r..................'),'',
   "An invalid board returns an empty string");
is(resolve_board('5.0,4,....................'),'',
   "Rows Value must be integer");
is(resolve_board('5,4.0,....................'),'',
   "Cols Value must be integer");
is(resolve_board("Rows=5,\n"~
        	 "Cols=4,\n"~
                 " ....\n"~
                 " ....\n"~
                 " ....\n"~
                 " ....\n"~
                 " ....\n"),
    '5,4,....................','Invalid chars are ignored');
is(print_board('1,1,.'),"(1,1),\n     .",'Prints ok');
                              
is(print_board('2,3,......'),"(2,3),\n     ...\n     ...",'Prints ok');
is('4,4,**.*............',resolve_board(resolve_board('4,4,**.*............')),
   'blinker blinks'); 
   
done-testing;
