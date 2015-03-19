abstract FinancialAsset

STOCKS = [:LongStock, :ShortStock, :Stock]

for ST in STOCKS
    @eval begin
        type ($ST) <: FinancialAsset
            #ticker::Ticker
            ticker::Symbol
            basis::Float64
            quantity::Int
            currency::Currency
            tick::Float64
            multiplier::Float64
            id::Union(Nullable{FinancialID},FinancialID)
        end
    end 
end 

for ST in STOCKS
    @eval begin
        ($ST)(ticker, basis) = ($ST)(ticker, basis, 1, USD, .01, 1., Nullable{FinancialID}())
    end
end 

FUTS = [:Future, :LongFuture, :ShortFuture]

for F in FUTS
    @eval begin
        type ($F) <: FinancialAsset
            #ticker::Ticker
            ticker::Symbol
            basis::Float64
            suffix::UTF8String
            quantity::Int
            currency::Currency
            tick::Union(Float64, Nullable{Float64})
            multiplier::Union(Float64, Nullable{Float64})
            expiry::Union(Date, Nullable{Date})
            id::Union(FinancialID, Nullable{FinancialID})
        end
    end 
end 

for F in FUTS
    @eval begin
        ($F)(ticker, basis) = ($F)(ticker, basis, "", 1, USD, 
                                   Nullable{Float64}(), Nullable{Float64}(), 
                                   Nullable{Date}(), Nullable{FinancialID}())
    end
end 

OPTIONS = [:LongPut, :LongCall, :ShortPut, :ShortCall]

for OP in OPTIONS
    @eval begin
        type ($OP) <: FinancialAsset
            #ticker::Ticker
            ticker::Symbol
            basis::Float64
            strike::Float64
            expiry::Union(Date, Nullable{Date})
            quantity::Int
            currency::Currency
            style::Union(OptionExercise, Nullable{OptionExercise})
            tick::Union(Float64, Nullable{Float64})
            multiplier::Union(Float64, Nullable{Float64})
            id::Union(FinancialID, Nullable{FinancialID})
        end
    end 
end 

for OP in OPTIONS
    @eval begin
        ($OP)(ticker, basis, strike) = ($OP)(ticker, basis, strike, Nullable{Date}(), 1, USD,
                                             Nullable{OptionExercise}(), Nullable{Float64}(), 
                                             Nullable{Float64}(), Nullable{FinancialID}())
    end
end 

type CurrencyPair <: FinancialAsset
    baseside::Currency
    quoteside::Currency
end

type Bond <: FinancialAsset
end

############ show methods ################

function show(io::IO, s::Union(LongStock, ShortStock, Stock))
    println(io, @sprintf("ticker:         %s", s.ticker))
    println(io, @sprintf("basis:          %s", s.basis))
    println(io, @sprintf("quantity:         %s", s.quantity))
    println(io, @sprintf("currency:       %s", s.currency))
    println(io, @sprintf("tick:           %s", s.tick))
    println(io, @sprintf("multiplier:     %s", s.multiplier))
    
    if typeof(s.id) == Nullable{FinancialID} 
    println(io, @sprintf("id:             %s", "NA"))
    else
    println(io, @sprintf("id:             %s", s.id))
    end
end

function show(io::IO, f::Union(LongFuture, ShortFuture, Future))
    println(io, @sprintf("ticker:         %s", string(f.ticker)) * "/" * f.suffix) #concat the ticker and suffix
    println(io, @sprintf("basis:          %s", f.basis))
    println(io, @sprintf("quantity:      %s", f.quantity))
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

function show(io::IO, opt::Union(LongPut, ShortPut, LongCall, ShortCall))
    if typeof(opt) == LongPut 
    println(io, @sprintf("type:           LongPut"))
    elseif typeof(opt) == LongCall 
    println(io, @sprintf("type:           LongCall"))
    elseif typeof(opt) == ShortPut 
    println(io, @sprintf("type:           ShortPut"))
    else
    println(io, @sprintf("type:           ShortCall"))
    end

    println(io, @sprintf("ticker:         %s", opt.ticker))
    println(io, @sprintf("basis:          %s", opt.basis))
    println(io, @sprintf("strike:         %s", opt.strike))

    if typeof(opt.expiry) == Nullable{Date} 
    println(io, @sprintf("expiry:         %s", "NA"))
    else
    println(io, @sprintf("expiry:         %s", opt.expiry))
    end

    println(io, @sprintf("quantity:      %s", opt.quantity))
    println(io, @sprintf("currency:       %s", opt.currency))

    if typeof(opt.style) == Nullable{OptionExercise} 
    println(io, @sprintf("style:          %s", "NA"))
    else
    println(io, @sprintf("style:          %s", opt.style))
    end

    if typeof(opt.tick) == Nullable{Float64} 
    println(io, @sprintf("tick:           %s", "NA"))
    else
    println(io, @sprintf("tick:           %s", opt.tick))
    end

    if typeof(opt.multiplier) == Nullable{Float64} 
    println(io, @sprintf("multiplier:     %s", "NA"))
    else
    println(io, @sprintf("multiplier:     %s", opt.multiplier))
    end

    if typeof(opt.id) == Nullable{FinancialID} 
    println(io, @sprintf("id:             %s", "NA"))
    else
    println(io, @sprintf("id:             %s", opt.id))
    end
end


function show(io::IO, c::CurrencyPair)
    print(io, @sprintf("%s/%s", string(c.baseside), string(c.quoteside)))
end
