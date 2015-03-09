abstract FinancialAsset

STOCKS = [:LongStock, :ShortStock, :Stock]

for ST in STOCKS
    @eval begin
        type ($ST) <: FinancialAsset
            ticker::Ticker
            basis::Float64
            currency::Currency
            tick::Float64
            multiplier::Float64
            id::Union(Nullable{FinancialID},FinancialID)
        end
    end 
end 

for ST in STOCKS
    @eval begin
        ($ST)(ticker, basis) = ($ST)(ticker, basis, USD, .01, 1., Nullable{FinancialID}())
    end
end 

FUTS = [:LongFuture, :ShortFuture]

for F in FUTS
    @eval begin
        type ($F) <: FinancialAsset
            ticker::Ticker
            basis::Float64
            suffix::UTF8String
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
        ($F)(ticker, basis) = ($F)(ticker, basis, "", USD, 
                                   Nullable{Float64}(), Nullable{Float64}(), 
                                   Nullable{Date}(), Nullable{FinancialID}())
    end
end 

OPTIONS = [:LongPut, :LongCall, :ShortPut, :ShortCall]

for OP in OPTIONS
    @eval begin
        type ($OP) <: FinancialAsset
            ticker::Ticker
            basis::Float64
            strike::Float64
            expiry::Date
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
        ($OP)(ticker, basis, strike) = ($OP)(ticker, basis, strike, today(), USD,
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

function show(io::IO, s::Union(LongStock, ShortStock,Stock))
    println(io, @sprintf("ticker:         %s", s.ticker))
#     println(io, @sprintf("currency:       %s", s.currency))
#     println(io, @sprintf("tick:           %s", s.tick))
#     println(io, @sprintf("multiplier:     %s", s.multiplier))
#     
#     if typeof(s.id) == Nullable{FinancialID} 
#     println(io, @sprintf("id:             %s", "NA"))
#     else
#     println(io, @sprintf("id:             %s", s.id))
#     end
end

function show(io::IO, f::Union(LongFuture, ShortFuture))
    println(io, @sprintf("ticker:         %s", f.ticker))
    println(io, @sprintf("suffix:         %s", f.suffix))
#     println(io, @sprintf("currency:       %s", f.currency))
#
#     if typeof(f.tick) == Nullable{Float64} 
#     println(io, @sprintf("tick:           %s", "NA"))
#     else
#     println(io, @sprintf("tick:           %s", f.tick))
#     end
#
#     if typeof(f.multiplier) == Nullable{Float64} 
#     println(io, @sprintf("multiplier:     %s", "NA"))
#     else
#     println(io, @sprintf("multiplier:     %s", f.multiplier))
#     end
#
#     if typeof(f.start) == Nullable{Date} 
#     println(io, @sprintf("start:          %s", "NA"))
#     else
#     println(io, @sprintf("start:          %s", f.start))
#     end
#
#     if typeof(f.expiry) == Nullable{Date} 
#     println(io, @sprintf("expiry:         %s", "NA"))
#     else
#     println(io, @sprintf("expiry:         %s", f.expiry))
#     end
#
#     if typeof(f.id) == Nullable{FinancialID} 
#     println(io, @sprintf("id:             %s", "NA"))
#     else
#     println(io, @sprintf("id:             %s", f.id))
#     end
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
    println(io, @sprintf("strike:         %s", opt.strike))
    println(io, @sprintf("expiry:         %s", opt.expiry))
    println(io, @sprintf("currency:       %s", opt.currency))

#     if typeof(opt.style) == Nullable{OptionExercise} 
#     println(io, @sprintf("style:          %s", "NA"))
#     else
#     println(io, @sprintf("style:          %s", opt.style))
#     end
# 
#     if typeof(opt.tick) == Nullable{Float64} 
#     println(io, @sprintf("tick:           %s", "NA"))
#     else
#     println(io, @sprintf("tick:           %s", opt.tick))
#     end
# 
#     if typeof(opt.multiplier) == Nullable{Float64} 
#     println(io, @sprintf("multiplier:     %s", "NA"))
#     else
#     println(io, @sprintf("multiplier:     %s", opt.multiplier))
#     end
# 
#     if typeof(opt.start) == Nullable{Date} 
#     println(io, @sprintf("start:          %s", "NA"))
#     else
#     println(io, @sprintf("start:          %s", opt.start))
#     end
# 
#     if typeof(opt.id) == Nullable{FinancialID} 
#     println(io, @sprintf("id:             %s", "NA"))
#     else
#     println(io, @sprintf("id:             %s", opt.id))
#     end
end


function show(io::IO, c::CurrencyPair)
    print(io, @sprintf("%s/%s", string(c.baseside), string(c.quoteside)))
end
