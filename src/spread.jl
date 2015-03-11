abstract AssetSpread <: FinancialAsset

type CoveredCall <: AssetSpread
    long::LongStock
    short::ShortCall
    risk::Float64

    CoveredCall(long, short) = new(long, short, (long.basis - short.basis))
end

type LongPutVertical <: AssetSpread
    long::LongPut
    short::ShortPut
    risk::Float64

    function LongPutVertical(long, short) 
        if typeof(long) == LongPut && typeof(short) == ShortPut
            risk = long.basis - short.basis
            new(long, short, risk)
        elseif typeof(long) == ShortPut && typeof(short) == LongPut
            risk = short.basis - long.basis
            new(short, long, risk) # flip arguments if they come in the wrong order
        else
            error("elements must include one ShortPut and one LongPut") # enforce one short and one long and switch them if order is incorrect
        end
    end
end

type LongCallVertical <: AssetSpread
    long::LongCall
    short::ShortCall
    risk::Float64

    function LongCallVertical(long, short) 
        _checkcall(long,short)
        risk = short.basis - long.basis
        new(long, short, risk)
    end
end

type ShortPutVertical <: AssetSpread
    long::LongPut
    short::ShortPut
    risk::Float64

    function ShortPutVertical(long, short) 
        _checkput(long,short)
        risk = abs(long.strike - short.strike) - (short.basis - long.basis)
        new(long, short, risk)
    end
end

type ShortCallVertical <: AssetSpread
    long::LongCall
    short::ShortCall
    risk::Float64

    function ShortCallVertical(long, short) 
        _checkcall(long,short)
        risk = abs(long.strike - short.strike) - (short.basis - long.basis)
        new(long, short, risk)
    end
end

# pull out invariant code to avoid duplication

function _checkput(long, short)

    if long.ticker.id != short.ticker.id
        error("Spreads with different underlyings not supported") # enforce same underlying
    else
        nothing
    end

    if typeof(long) == ShortPut && typeof(short) == LongPut
        return(temp = short; short = long; long = temp) # flip arguments if they come in the wrong order
    elseif typeof(long) == LongPut && typeof(short) == ShortPut
        nothing
    else
        error("elements must include one ShortPut and one LongPut") # enforce one short and one long and switch them if order is incorrect
    end
end

function _checkcall(long, short)

    if long.ticker.id != short.ticker.id
        error("Spreads with different underlyings not supported") # enforce same underlying
    else
        nothing
    end

    if typeof(long) == ShortCall && typeof(short) == LongCall
        return(short = long ; long  = short) # flip arguments if they come in the wrong order
    elseif typeof(long) == LongCall && typeof(short) == ShortCall
        nothing
    else
        error("elements must include one ShortPut and one LongPut") # enforce one short and one long and switch them if order is incorrect
    end
end

# show
function show(io::IO, s::AssetSpread)
    typ = split(string(typeof(s)), ".")[2] # FinancialAssets.LongPut -> LongPut (e.g.)
    println(io, @sprintf("spread:         %s%s", typ, " Spread"))
    println(io, @sprintf("ticker:         %s", s.long.ticker))
    println(io, @sprintf("risk:           %s", trunc(s.risk,2))) # only show two decimals
end
