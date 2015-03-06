facts("asset constructors work") do

    context("Stock") do
        @pending Stock(Ticker("AAPL")).ticker  => Ticker("AAPL")
        @fact Stock(Ticker("AAPL")).currency   => USD
        @fact Stock(Ticker("AAPL")).tick       => .01
        @fact Stock(Ticker("AAPL")).multiplier => 1.0
        @fact typeof(Stock(Ticker("AAPL")).id) => Nullable{FinancialID}
    end

    context("Future") do
        @pending Future(Ticker("ES")).ticker          => Ticker("ES")
        @fact Future(Ticker("ES")).suffix             => ""
        @fact Future(Ticker("ES")).currency           => USD
        @fact typeof(Future(Ticker("ES")).tick)       => Nullable{Float64}
        @fact typeof(Future(Ticker("ES")).multiplier) => Nullable{Float64}
        @fact typeof(Future(Ticker("ES")).start)      => Nullable{Date}
        @fact typeof(Future(Ticker("ES")).expiry)     => Nullable{Date}
        @fact typeof(Future(Ticker("ES")).id)         => Nullable{FinancialID}
    end

    context("Option") do
    end

    context("Bond") do
    end

    context("CurrencyPair") do
    end
end
