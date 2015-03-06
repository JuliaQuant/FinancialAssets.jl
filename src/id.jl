abstract FinancialID

IDLIST = [:Ticker, 
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
