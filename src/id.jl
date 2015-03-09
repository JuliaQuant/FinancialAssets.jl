abstract FinancialID

IDLIST = [:Ticker, 
          :OptionExercise,
          :CUSIP,
          :BloombergID,
          :ReutersID]

for ID in IDLIST
  @eval begin
    type ($ID) <: FinancialID
        id::UTF8String
    end
  end 
end 

for ID in IDLIST
  @eval begin
    function show(io::IO, c::($ID))
        print(io, @sprintf("%s", c.id))
    end
  end
end

abstract AbstractCurrency

type Currency <: AbstractCurrency
    origin::UTF8String
end

function show(io::IO, c::Currency)
    print(io, @sprintf("%s", c.origin))
end
