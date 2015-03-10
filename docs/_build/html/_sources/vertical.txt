Vertical
========

A vertical spread consists of one or more options at two separate strike prices. All the options must be of the same type (either calls or puts). 
Option(s) at one strike price must be long options with limited risk (typically the cost of the option)  and the other strike price must be hold 
short option(s) with sometimes unlimited risk. Short call options have theoretically unlimited risk since a price can continue (theoretically) to 
infinity. Short put options hold the same risk as long stock and have risk equivalent to the strike price minus premium received. 


+-------------------+-------------------------------------------------+ 
| Constraint        | Description                                     | 
+===================+=================================================+ 
| number of strikes | two different strike prices for the options     |
+-------------------+-------------------------------------------------+ 
| same type         | all options are either calls or puts            |
+-------------------+-------------------------------------------------+ 
| long/short        | one strike is long, the other strike is short   |
+-------------------+-------------------------------------------------+ 
| same expiry       | all the options have identical expiration dates |
+-------------------+-------------------------------------------------+ 

The strike price 
of the short option can guide us in determining if the vertical is either a short vertical or long vertical. If the short option is more in the money, 
the spread is considered a short vertical.

In a short vertical, the trader receives income and hopes to keep this premium throughout the life of the vertical spread. In a long vertical, the trader
outlays money and expects the investment to gain in value during the life of the vertical spread.
