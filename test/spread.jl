facts("spread constructors work") do

    context("vertical") do
        
        p1 = LongPut(Ticker("SPX"), 2000.00, Date(2015,3,19))
        p2 = ShortPut(Ticker("SPX"), 2010.00, Date(2015,3,19))
        p3 = ShortPut(Ticker("SPX"), 1990.00, Date(2015,3,19))

        @pending typeof(p1 + p2) => Spread{ShortPut, LongPut}
        @pending typeof(p1 + p3) => Spread{LongPut, ShortPut}
        @pending typeof(p1 + p2) => LongPutVertical
        @pending typeof(p1 + p3) => ShortPutVertical
    end

    context("butterfly") do
        
        p1 = LongPut(Ticker("SPX"), 2000.00, Date(2015,3,19))
        p2 = ShortPut(Ticker("SPX"), 2010.00, Date(2015,3,19))
        p3 = ShortPut(Ticker("SPX"), 1990.00, Date(2015,3,19))

        @pending typeof(p1 + 2p2 + p3) => Spread(ShortPutVertical, LongPutVertical)
        @pending typeof(p1 + 2p2 + p3) => LongPutButterfly
    end

    context("covered call") do
        
        stk  = Stock(Ticker("AAPL"), 100.00)
        stk  = LongStock(Ticker("AAPL"), 100.00)
        sstk = Stock(Ticker("AAPL"), -100.00)
        sstk = ShortStock(Ticker("AAPL"), 100.00)
        c1   = ShortCall(Ticker("AAPL"), 120.00, Date(2015,3,19))
        p1   = ShortPutl(Ticker("AAPL"), 120.00, Date(2015,3,19))

        @pending typeof(stk + c1)  => Spread(Stock, ShortCall)
        @pending typeof(sstk + p1) => Spread(Stock, ShortPut)
        @pending typeof(stk + c1)  => CoveredCall
        @pending typeof(sstk + p1) => CoveredPut
    end
