if VERSION < v"0.4-"
    using Dates
else
    using Base.Dates
end

module FinancialAssets

if VERSION < v"0.4-"
    using Dates
else
    using Base.Dates
end

import Base: show

export Stock, Future, PutOption, CallOption,
       Ticker, OptionExercise,
       CUSIP, BloombergID, ReutersID, FinancialID,
       American, European,
       Currency, CurrencyPair,
       USD, EUR, GBP, AUD, JPY,
       EURUSD, EURJPY, USDGBP, USDAUD, USDNZD, USDJPY,
       F, G, H, J, K, M, N, Q, U, V, X, Z

include("id.jl")
include("assets.jl")
include("const.jl")

end
