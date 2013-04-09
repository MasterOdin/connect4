# connect4

## About
One player connect-4 game run through matlab using minimax w/ alpha-beta pruning algorithm.

Algorithm takes into account number of connect n-out-of-4 (0 > n > 4) with no opposing pieces in the line. Weighs the n with 1 point for 1, 50 for 2, and 100 for 3.

Written for CSC 380 (Spring 2013)

## Continuations
+ See if best algorithm isn't exactly zero-sum (favor minimizing over maximizing to block player always)
+ See if changing the weight for the n values affects AI decisions. Mainly curious to lower value for 2-out-of-4 to better AI defenses  
+ Find best mix of runtime per move and number of moves to look ahead. Currently set at 4 and easy to outthink AI and force a win  
+ Update basic logic for finding row/col in computermove.m. Might yield some speed improvement in reduced for loops

## Thanks
[Edward Kim](http://www.edwardkim.net/) provided skeleton code for project giving code for:  
click.m  
addpiece.m  
addpeice_noanim.m  
check4win.m  
checkplayer.m  
playconnect4.m  
