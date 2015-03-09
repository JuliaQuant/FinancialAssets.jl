facts("asset constructors work") do

    context("Stock") do
        
        stk = Stock(Ticker("AAPL"))

        @pending stk.ticker  => Ticker("AAPL")
        @fact stk.currency   => USD
        @fact stk.tick       => .01
        @fact stk.multiplier => 1.0
        @fact typeof(stk.id) => Nullable{FinancialID}
    end

    context("Future") do

        fut = Future(Ticker("ES"))

        @pending fut.ticker          => Ticker("ES")
        @fact fut.suffix             => ""
        @fact fut.currency           => USD
        @fact typeof(fut.tick)       => Nullable{Float64}
        @fact typeof(fut.multiplier) => Nullable{Float64}
        @fact typeof(fut.start)      => Nullable{Date}
        @fact typeof(fut.expiry)     => Nullable{Date}
        @fact typeof(fut.id)         => Nullable{FinancialID}
    end

    context("Option") do

        popt = PutOption(Ticker("SPX"), 2010.00) 
        copt = CallOption(Ticker("SPX"), 2010.00) 

        @fact typeof(popt)            => PutOption
        @fact typeof(copt)            => CallOption
        @pending popt.underlying      => Ticker("SPX")
        @pending copt.underlying      => Ticker("SPX")
        @fact popt.strike             => 2010.00
        @fact copt.strike             => 2010.00
        @fact popt.expiry             => today()
        @fact copt.expiry             => today()
        @fact popt.currency           => USD
        @fact copt.currency           => USD
        @fact typeof(popt.style)      => Nullable{OptionExercise}
        @fact typeof(copt.style)      => Nullable{OptionExercise}
        @fact typeof(popt.tick)       => Nullable{Float64}
        @fact typeof(copt.tick)       => Nullable{Float64}
        @fact typeof(popt.multiplier) => Nullable{Float64}
        @fact typeof(copt.multiplier) => Nullable{Float64}
        @fact typeof(popt.start)      => Nullable{Date}
        @fact typeof(copt.start)      => Nullable{Date}
        @fact typeof(popt.id)         => Nullable{FinancialID}
        @fact typeof(copt.id)         => Nullable{FinancialID}
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
