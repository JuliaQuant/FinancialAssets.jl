facts("FinancialID constructors works") do

    context("Strings work") do
        @fact Ticker("AAPL").id              => "AAPL"
        @fact CUSIP("008000AA7").id         =>  "008000AA7"
        @fact ReutersID("IBM.N").id          => "IBM.N"
        @fact BloombergID("627065740034").id => "627065740034"
    end

    context("non-strings fail") do
        @fact_throws Ticker(123).id
        @fact_throws CUSIP(123).id
        @fact_throws ReutersID(123).id 
        @fact_throws BloombergID(123).id 
    end
end

facts("Currency constructor works") do

    context("Strings work") do
        @fact Currency("AED").origin => "AED"
    end

    context("non-strings fail") do
        @fact_throws Currency(123).origin
    end
end
