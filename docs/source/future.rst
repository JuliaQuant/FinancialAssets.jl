Futures
=======

Futures are derivative contracts that allow the control of a fixed size of underlying asset to the owner, and an obligation to deliver the
underlying asset at the strike price by the seller. The underlying asset can be a commodity, such as corn, or a financial index, such as
the S&P 500. 

Three types are provided to model futures including ``Future``, ``LongFuture`` and ``ShortFuture``. The ``Future`` type can be used to represent
both long and short positions, simply by providing positive or negative values in the ``basis`` element. ``LongFuture`` and ``ShortFuture`` types are
provided as a convenience and methods dispatched on them assumes long and short positions, respectively. 

+-----------------+----------------------------------------------------------------+
| Stock type      | Description                                                    |
+=================+================================================================+
| ``Future``      | futures contract with either long or short posiition permitted |
+-----------------+----------------------------------------------------------------+
| ``LongFuture``  | futures contract with only long positions allowed              |
+-----------------+----------------------------------------------------------------+
| ``ShortFuture`` | futures contract with only short positions allowed             |
+-----------------+----------------------------------------------------------------+

All the futures types hold the same fields. To create an object, only the ``ticker`` and ``basis`` elements needs to be provided. Default values ]
or ``Nullalbe`` fields will be filled in for the other fields. 

+----------------+---------------------------------------------+-----------------+ 
| Type field     | Description                                 | Type            | 
+================+=============================================+=================+ 
| ``ticker``     | trading symbol                              | ``Ticker``      |
+----------------+---------------------------------------------+-----------------+ 
| ``basis``      | position price                              | ``Float64``     |
+----------------+---------------------------------------------+-----------------+ 
| ``suffix``     | month and year expiry string                | ``UTF8String``  |
+----------------+---------------------------------------------+-----------------+ 
| ``currency``   | national currency                           | ``Currency``    |
+----------------+---------------------------------------------+-----------------+ 
| ``tick``       | increments traded in                        | ``Float64``     | 
+----------------+---------------------------------------------+-----------------+ 
| ``multiplier`` | degree to adjust position based on price    | ``Flot64``      | 
+----------------+---------------------------------------------+-----------------+ 
| ``expirty``    | expiration date for the contrct             | ``Date``        | 
+----------------+---------------------------------------------+-----------------+ 
| ``id``         | a unique non-exchange identification symbol | ``FinancialID`` | 
+----------------+---------------------------------------------+-----------------+ 

An example in REPL, creating an object representing the ES (S&P 500) contract::

    julia> sp500 = LongFuture(Ticker("ES"), 2050.25)
    ticker:         ES
    suffix:         

Other field information is accessible with standard ``.`` notation::

    julia> sp500.currency
    USD
