Vertical
========

A vertical spread consists of one or more options at two separate strike prices. All the options must be of the same type (either calls or puts). 
Vertical spreads allow traders to sell calls and puts that have high risk and mitigate the risk with suitable long calls and puts, which have 
strikes different from the short calls and puts. All the options inside a vertical spread must have the same expiration date. 

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

Four types are provided to model vertical spreads.

+---------------------+------------------------------------------------+------------------------------------------------+ 
| Type                | Risk                                           | Reward                                         | 
+=====================+================================================+================================================+ 
| Long Put Vertical   | premium paid                                   | spread between long/short strikes less premium |
+----------------------------------------------------------------------+------------------------------------------------+ 
| Long Call Vertical  | premium paid                                   | spread between long/short strikes less premium |
+----------------------------------------------------------------------+------------------------------------------------+ 
| Short Put Vertical  | spread between long/short strikes less premium | premium received                               |
+----------------------------------------------------------------------+------------------------------------------------+ 
| Short Call Vertical | spread between long/short strikes less premium | premium received                               |
+---------------------+------------------------------------------------+------------------------------------------------+ 
