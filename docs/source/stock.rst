Stock
=====

Common stock typically represents ownership in a company. Three types are provided to model stocks, ``Stock``, ``LongStock`` and ``ShortStock``. 
The ``Stock`` type can be used to represent both long and short positions, simply by providing positive or negative values in the ``basis`` element.
``LongStock`` and ``ShortStock`` types are provided as a convenience and methods dispatched on them assumes long and short positions, respectively. 

+----------------+-------------------------------------------------------------+
| Stock type     | Description                                                 |
+================+=============================================================+
| ``Stock``      | common stock with either long or short posiition permittead |
+----------------+-------------------------------------------------------------+
| ``LongStock``  | common stock with only long positions allowed               |
+----------------+-------------------------------------------------------------+
| ``ShortStock`` | common stock with only short positions allowed              |
+----------------+-------------------------------------------------------------+

All the stock types hold the same fields. To create an object, only the ``ticker`` and ``basis`` elements needs to be provided. Default values will 
be filled in for ``tick`` (.01), ``currency`` (USD) and ``multiplier`` (1.0).


+----------------+---------------------------------------------+-----------------+ 
| Type field     | Description                                 | Type            | 
+================+=============================================+=================+ 
| ``ticker``     | trading symbol                              | ``Ticker``      |
+----------------+---------------------------------------------+-----------------+ 
| ``basis``      | position price                              | ``Float64``     |
+----------------+---------------------------------------------+-----------------+ 
| ``currency``   | national currency                           | ``Currency``    |
+----------------+---------------------------------------------+-----------------+ 
| ``tick``       | increments traded in                        | ``Float64``     | 
+----------------+---------------------------------------------+-----------------+ 
| ``multiplier`` | degree to adjust position based on price    | ``Flot64``      | 
+----------------+---------------------------------------------+-----------------+ 
| ``id``         | a unique non-exchange identification symbol | ``FinancialID`` | 
+----------------+---------------------------------------------+-----------------+ 

An example in REPL, creating an object representing Apple Computer, Inc.::

    julia> Apple = Stock(Ticker("AAPL"), 100.00)
    ticker:         AAPL

Other field information is accessible with standard ``.`` notation::

    julia> Apple.currency
    USD
