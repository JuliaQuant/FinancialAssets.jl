function *(n::Int, asset::FinancialAsset)
    if typeof(asset) == Stock || LongStock || ShortStock
        asset.shares = asset.shares * n
    else
        asset.contracts = asset.contracts * n
    end
    asset
end

function +(x::LongPut, y::ShortPut) 
    x.ticker != y.ticker ? error("Only same underlying spreads supported") : nothing

    x.contracts != y.contracts ? error("Only same contract size supported") : nothing

    x.expiry != y.expiry ? error("Only same expiry supported") : nothing

    if x.strike == y.strike
        error("Options cancel each other out")
    elseif x.strike > y.strike
        ShortPutVertical(x,y)
    else
        LongPutVertical(x,y)
    end
end
