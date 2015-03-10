Spreads
=======

Modeling spreads is provided with various spread types, all of which use the ``abstract AssetSpread`` as their parent. 

Spreads represent a derived asset that includes both long and short positions. These positions can be long and short options, and
long and short stocks. The ``+`` operator is defined for various combinations of these four financial assets.

While spreads are used to define risk, there are other factors at play that traders need to consider such as pin risk and exercise risk. The 
risk that is kept track of with these types does not cover all real-world risks, but merely keeps track of the perfect-world theoretical risk.

.. toctree::
   :maxdepth: 2

   vertical
   coveredcall
   calendar
   condor
   butterfly
   ironcondor
   diagonal
   syntheticstock

