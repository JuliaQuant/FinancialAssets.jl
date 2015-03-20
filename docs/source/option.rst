Options
=======

Options are derivative contracts written against an underlying asset. They come in four flavors depending whether they are calls or puts, and
depending on whether they are short or long.

A long put option costs money to purchase and gives the owner the right to sell the underlying at the strike price.  A long call option also costs 
money to purchase and gives the owner the right to purchase the underlying at the strike price. 

A short put option pays the seller a premium and obligates them to buy the underlying at the strike price should the owner of the long option chooses 
to exercise. A short call option also pays the seller a premium, and requires them to sell the underlying at the strike price when the owner elects to 
exercise.

The risk associated with single long options is simply the cost of the option. Risks asssociated with single short options depends on whether they are
short puts or short calls. Short puts carry almost the same risk as owning the underlying outright, but less so because a premium is received to sell this 
option.  A single short call option also receives a premium, but this risk is considered unlimited since the price of an underlying is not bounded on the 
upside, as they are bounded on the bottom side (underlying price cannot go below zero). 

Four types are provided to model these single options:

+---------------+-----------------------------------------------+------------------------------------+ 
| Option type   | Description                                   | Risk                               | 
+===============+===============================================+====================================+ 
| ``LongPut``   | Right to sell underlying at strike price      | cost of option                     |
+---------------+-----------------------------------------------+------------------------------------+ 
| ``LongCall``  | Right to buy underlying at strike price       | cost of option                     |
+---------------+-----------------------------------------------+------------------------------------+ 
| ``ShortPut``  | Obligation to sell underlying at strike price | premium received less strike price |
+---------------+-----------------------------------------------+------------------------------------+ 
| ``ShortCall`` | Obligation to buy underlying at strike price  | unlimited                          | 
+---------------+-----------------------------------------------+------------------------------------+ 

Each option type as the same fields.

+----------------+---------------------------------------------+--------------------+ 
| Type field     | Description                                 | Type               | 
+================+=============================================+====================+ 
| ``ticker``     | trading symbol of underlying asset          | ``Ticker``         |
+----------------+---------------------------------------------+--------------------+ 
| ``basis``      | position price                              | ``Float64``        |
+----------------+---------------------------------------------+--------------------+ 
| ``strike``     | option strike price                         | ``Float64``        |
+----------------+---------------------------------------------+--------------------+ 
| ``expiry``     | date of option expiration                   | ``Date``           |
+----------------+---------------------------------------------+--------------------+ 
| ``quantity``   | number of contracts                         | ``Int``           |
+----------------+---------------------------------------------+--------------------+ 
| ``currency``   | national currency                           | ``Currency``       |
+----------------+---------------------------------------------+--------------------+ 
| ``style``      | option exercise style (American, European)  | ``OptionExercise`` |
+----------------+---------------------------------------------+--------------------+ 
| ``tick``       | increments traded in                        | ``Float64``        | 
+----------------+---------------------------------------------+--------------------+ 
| ``multiplier`` | degree to adjust position based on price    | ``Flot64``         | 
+----------------+---------------------------------------------+--------------------+ 
| ``id``         | a unique non-exchange identification symbol | ``FinancialID``    | 
+----------------+---------------------------------------------+--------------------+ 

An example in REPL::

    julia> Appleput = LongPut(Ticker("AAPL"), 1.21, 90.00)
    type:           LongPut
    ticker:         AAPL
    strike:         90.0
    expiry:         2015-03-09
    currency:       USD

The default ``expiry`` is today, which is more likely incorrect. The default currency is ``USD``.
