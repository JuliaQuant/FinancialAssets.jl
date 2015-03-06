abstract AbstractCurrency

type Currency <: AbstractCurrency
    origin::UTF8String
end

abstract FinancialAsset

type Stock <: FinancialAsset
    ticker::Ticker
    currency::Currency
    tick::Float64
    multiplier::Float64
    id::Union(Nullable{FinancialID},FinancialID)
end

Stock(ticker::Ticker) = Stock(ticker, USD, .01, 1, Nullable{FinancialID}())

type Future <: FinancialAsset
    ticker::Ticker
    suffix::UTF8String
    currency::Currency
    tick::Union(Float64, Nullable{Float64})
    multiplier::Union(Float64, Nullable{Float64})
    start::Union(Date, Nullable{Date})
    expiry::Union(Date, Nullable{Date})
    id::Union(FinancialID, Nullable{FinancialID})
end

Future(ticker::Ticker) = Future(ticker, 
                                "", 
                                USD,
                                Nullable{Float64}(), 
                                Nullable{Float64}(), 
                                Nullable{Date}(), 
                                Nullable{Date}(), 
                                Nullable{FinancialID}())

type Bond <: FinancialAsset
end

type CurrencyPair <: FinancialAsset
    baseside::Currency
    quoteside::Currency
end

############ show methods ################


function show(io::IO, s::Stock)
    println(io, @sprintf("ticker:         %s", s.ticker))
    println(io, @sprintf("currency:       %s", s.currency))
    println(io, @sprintf("tick:           %s", s.tick))
    println(io, @sprintf("multiplier:     %s", s.multiplier))
    if typeof(s.id) == Nullable{FinancialID} 
    println(io, @sprintf("id:             %s", "NA"))
    else
    println(io, @sprintf("id:             %s", s.id))
    end
end

function show(io::IO, f::Future)
    println(io, @sprintf("ticker:         %s", f.ticker))
    println(io, @sprintf("suffix:         %s", f.suffix))
    println(io, @sprintf("currency:       %s", f.currency))
    if typeof(f.tick) == Nullable{Float64} 
    println(io, @sprintf("tick:           %s", "NA"))
    else
    println(io, @sprintf("tick:           %s", f.tick))
    end
    if typeof(f.multiplier) == Nullable{Float64} 
    println(io, @sprintf("multiplier:     %s", "NA"))
    else
    println(io, @sprintf("multiplier:     %s", f.multiplier))
    end
    if typeof(f.start) == Nullable{Date} 
    println(io, @sprintf("start:          %s", "NA"))
    else
    println(io, @sprintf("start:          %s", f.start))
    end
    if typeof(f.expiry) == Nullable{Date} 
    println(io, @sprintf("expiry:         %s", "NA"))
    else
    println(io, @sprintf("expiry:         %s", f.expiry))
    end
    if typeof(f.id) == Nullable{FinancialID} 
    println(io, @sprintf("id:             %s", "NA"))
    else
    println(io, @sprintf("id:             %s", f.id))
    end
end

function show(io::IO, c::Currency)
    print(io, @sprintf("%s", c.origin))
end

function show(io::IO, c::CurrencyPair)
    print(io, @sprintf("%s/%s", string(c.baseside), string(c.quoteside)))
end
