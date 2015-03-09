abstract AssetSpread <: FinancialAsset

type CoveredCall <: AssetSpread
    long::LongStock
    short::ShortCall
    risk::Float64

    CoveredCall(long, short) = new(long, short, (long.basis - short.basis))
end

type LongVertical <: AssetSpread
    long::Union(LongPut, LongCall)
    short::Union(ShortPut, ShortCall)
    risk::Float64

    function LongVertical(long, short) 
        _check(long,short)
        risk = short.basis - long.basis
        new(long, short, risk)
    end
end

type ShortVertical <: AssetSpread
    long::Union(LongPut, LongCall)
    short::Union(ShortPut, ShortCall)
    risk::Float64

    function ShortVertical(long, short) 
        _check(long,short)
        risk = abs(long.strike - short.strike) - (short.basis - long.basis)
        new(long, short, risk)
    end
end

# pull out invariant code to avoid duplication
function _check(long, short)
    if long.ticker.id != short.ticker.id
        error("foo")
    elseif typeof(long) == LongPut && typeof(short) != ShortPut
        error("bar")
    elseif  typeof(long) == LongCall && typeof(short) != ShortCall
        error("baz")
    else
       nothing
    end
end

function show(io::IO, s::AssetSpread)
    typ = split(string(typeof(s)), ".")[2] # FinancialAssets.LongPut -> LongPut (e.g.)
    println(io, @sprintf("spread:         %s%s", typ, " Spread"))
    println(io, @sprintf("ticker:         %s", s.long.ticker))
    println(io, @sprintf("risk:           %s", trunc(s.risk,2))) # only show two decimals
end
