function *(n::Int, asset::FinancialAsset)
    if typeof(asset) == Stock || LongStock || ShortStock
        asset.shares = asset.shares * n
    else
        asset.contracts = asset.contracts * n
    end
    asset
end

function +(x::LongPut, y::ShortPut) 
    if x.ticker != y.ticker 
        error("Only same underlying spreads supported") 
    elseif contracts != y.contracts 
        error("Only same contract size supported")
    elseif x.expiry != y.expiry
        error("Only same expiry supported")
    elseif x.strike == y.strike
        error("Options cancel each other out")
    elseif x.strike > y.strike
        ShortPutVertical(x,y)
    else
        LongPutVertical(x,y)
    end
end

function +(x::Stock, y::Stock)
    if x.ticker != y.ticker
        error("Only same stock addition supported")
    elseif x.currency != y.currency
        error("Only same currency stock addition supported")
    else
        nothing
    end

    new_basis  = x.basis * x.shares/(x.shares + y.shares) + y.basis * y.shares/(x.shares + y.shares)
    new_shares = x.shares + y.shares
    new_id     = isnull(x.id) ? y.id : x.id

    Stock(x.ticker, new_basis, new_shares , x.currency, .01, 1., new_id)
end
