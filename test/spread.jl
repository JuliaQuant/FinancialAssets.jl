facts("spread constructors work") do

    context("long vertical") do
        
        p1 = LongPut(Ticker("SPX"), 1.50, 2000.00)
        p2 = ShortPut(Ticker("SPX"), 1.00, 2010.00)
        p3 = ShortPut(Ticker("SPX"), 2.00, 1990.00)

        c1 = LongCall(Ticker("SPX"), 1.50, 2000.00)
        c2 = ShortCall(Ticker("SPX"), 1.00, 2010.00)
        c3 = ShortCall(Ticker("SPX"), 2.00, 1990.00)

        @pending typeof(p1 + p2) => Spread{ShortPut, LongPut}
        @pending typeof(p1 + p3) => Spread{LongPut, ShortPut}
        @pending typeof(p1 + p2) => LongPutVertical
        @pending typeof(p1 + p3) => ShortPutVertical
    end

    context("short vertical") do

        p1 = LongPut(Ticker("SPX"), 1.50, 2000.00)
        p2 = ShortPut(Ticker("SPX"), 1.00, 2010.00)
        p3 = ShortPut(Ticker("SPX"), 2.00, 1990.00)

        c1 = LongCall(Ticker("SPX"), 1.50, 2000.00)
        c2 = ShortCall(Ticker("SPX"), 1.00, 2010.00)
        c3 = ShortCall(Ticker("SPX"), 2.00, 1990.00)

        @pending typeof(p1 + p2) => Spread{ShortPut, LongPut}
        @pending typeof(p1 + p3) => Spread{LongPut, ShortPut}
        @pending typeof(p1 + p2) => LongPutVertical
        @pending typeof(p1 + p3) => ShortPutVertical
    end

    context("covered call") do
        
        stk  = Stock(Ticker("AAPL"), 100.00)
        stk  = LongStock(Ticker("AAPL"), 100.00)
        sstk = Stock(Ticker("AAPL"), -100.00)
        sstk = ShortStock(Ticker("AAPL"), 100.00)

        c1   = ShortCall(Ticker("AAPL"), 1.00, 120.00)
        p1   = ShortPut(Ticker("AAPL"), 1.00, 120.00)

        cc   = CoveredCall(stk, cl)

        @fact cc.risk = 80.00

        @pending typeof(stk + c1)  => Spread(Stock, ShortCall)
        @pending typeof(sstk + p1) => Spread(Stock, ShortPut)
        @pending typeof(stk + c1)  => CoveredCall
        @pending typeof(sstk + p1) => CoveredPut
    end

    context("butterfly") do
        
        p1 = LongPut(Ticker("SPX"), 2000.00, Date(2015,3,19))
        p2 = ShortPut(Ticker("SPX"), 2010.00, Date(2015,3,19))
        p3 = ShortPut(Ticker("SPX"), 1990.00, Date(2015,3,19))

        @pending typeof(p1 + 2p2 + p3) => Spread(ShortPutVertical, LongPutVertical)
        @pending typeof(p1 + 2p2 + p3) => LongPutButterfly
    end
end
