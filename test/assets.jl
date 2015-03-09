facts("asset constructors work") do

    context("Stocks") do
        
        s  = Stock(Ticker("AAPL"), 100.00)
        ls = LongStock(Ticker("AAPL"), 100.00)
        ss = ShortStock(Ticker("AAPL"), 100.00)

        @fact typeof(s)  => Stock
        @fact typeof(ls) => LongStock
        @fact typeof(ss) => ShortStock

        @fact s.ticker.id  => "AAPL"
        @fact ls.ticker.id => "AAPL"
        @fact ss.ticker.id => "AAPL"

        @fact s.basis  => 100.00 
        @fact ls.basis => 100.00 
        @fact ss.basis => 100.00 

        @fact s.currency  => USD 
        @fact ls.currency => USD 
        @fact ss.currency => USD 

        @fact s.tick  => .01 
        @fact ls.tick => .01 
        @fact ss.tick => .01 

        @fact s.multiplier  => 1.0 
        @fact ls.multiplier => 1.0 
        @fact ss.multiplier => 1.0 

        @fact typeof(s.id)  => Nullable{FinancialID}
        @fact typeof(ls.id) => Nullable{FinancialID}
        @fact typeof(ss.id) => Nullable{FinancialID}
    end

    context("Futures") do

        lfut = LongFuture(Ticker("ES"), 2000.00)
        sfut = ShortFuture(Ticker("ES"), 2000.00)

        @fact typeof(lfut) => LongFuture
        @fact typeof(sfut) => ShortFuture

        @fact lfut.ticker.id => "ES"
        @fact sfut.ticker.id => "ES"
        
        @fact lfut.basis => 2000.00 
        @fact sfut.basis => 2000.00 

        @fact lfut.suffix => ""
        @fact sfut.suffix => ""

        @fact lfut.currency => USD
        @fact sfut.currency => USD

        @fact typeof(lfut.tick) => Nullable{Float64}
        @fact typeof(sfut.tick) => Nullable{Float64}

        @fact typeof(lfut.multiplier) => Nullable{Float64}
        @fact typeof(sfut.multiplier) => Nullable{Float64}

        @fact typeof(lfut.expiry) => Nullable{Date}
        @fact typeof(sfut.expiry) => Nullable{Date}

        @fact typeof(lfut.id) => Nullable{FinancialID}
        @fact typeof(sfut.id) => Nullable{FinancialID}
    end

    context("Options") do

        lp = LongPut(Ticker("SPX"), 1.45, 2000.00)
        lc = LongCall(Ticker("SPX"), 1.45, 2000.00)
        sp = ShortPut(Ticker("SPX"), 1.45, 2000.00)
        sc = ShortCall(Ticker("SPX"), 1.45, 2000.00)

        @fact typeof(lp) => LongPut
        @fact typeof(lc) => LongCall
        @fact typeof(sp) => ShortPut
        @fact typeof(sc) => ShortCall

        @fact lp.ticker.id => "SPX"
        @fact lc.ticker.id => "SPX"
        @fact sp.ticker.id => "SPX"
        @fact sc.ticker.id => "SPX"

        @fact lp.basis => 1.45 
        @fact lc.basis => 1.45 
        @fact sp.basis => 1.45 
        @fact sc.basis => 1.45 

        @fact lp.strike => 2000.00
        @fact lc.strike => 2000.00
        @fact sp.strike => 2000.00
        @fact sc.strike => 2000.00

        @fact lp.expiry => today()
        @fact lc.expiry => today()
        @fact sp.expiry => today()
        @fact sc.expiry => today()

        @fact lp.currency => USD
        @fact lc.currency => USD
        @fact sp.currency => USD
        @fact sc.currency => USD

        @fact typeof(lp.style) => Nullable{OptionExercise}
        @fact typeof(lc.style) => Nullable{OptionExercise}
        @fact typeof(sp.style) => Nullable{OptionExercise}
        @fact typeof(sc.style) => Nullable{OptionExercise}

        @fact typeof(lp.tick) => Nullable{Float64}
        @fact typeof(lc.tick) => Nullable{Float64}
        @fact typeof(sp.tick) => Nullable{Float64}
        @fact typeof(sc.tick) => Nullable{Float64}

        @fact typeof(lp.multiplier) => Nullable{Float64}
        @fact typeof(lc.multiplier) => Nullable{Float64}
        @fact typeof(sp.multiplier) => Nullable{Float64}
        @fact typeof(sc.multiplier) => Nullable{Float64}

        @fact typeof(lp.id) => Nullable{FinancialID}
        @fact typeof(lc.id) => Nullable{FinancialID}
        @fact typeof(sp.id) => Nullable{FinancialID}
        @fact typeof(sc.id) => Nullable{FinancialID}
    end

    context("Bond") do
    end

    context("CurrencyPair") do
        
        pair = CurrencyPair(EUR, USD)

        @fact pair.baseside          => EUR
        @fact pair.quoteside         => USD
        @fact typeof(pair.baseside)  => Currency
        @fact typeof(pair.quoteside) => Currency

    end
end
