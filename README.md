# Game_Life_Dojo

### [![Build Status](https://travis-ci.org/barcelonapm/Game_Life_Dojo.png)](https://travis-ci.org/barcelonapm/Game_Life_Dojo)
Randory dojo on [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life)

https://en.wikipedia.org/wiki/Conway's_Game_of_Life

Language [Perl6](https://perl6.org). 

[How to test](https://doc.perl6.org/language/testing)

##Input 

  #rows,#colums,#board 

##output 

  #rows,#columsm,#new_board

valid inputs are "0","1","2".."9",coma "," as separator zero "." represents dead cells and "*" live ones.

Non-valid caracteres are ignored so this two imputs represent the same board
 
    4,5,
     
       00000
       00*00
       000*0
       0***0

    4,5,0000000*00000*00***0
