abstract FinancialAsset

type Stock <: FinancialAsset
    ticker::Ticker
    currency::Currency
    tick::Float64
    multiplier::Float64
end

Stock(ticker::Ticker) = Stock(ticker, USD, .01, 1)

type Future <: FinancialAsset

end

type Bond <: FinancialAsset
end

type CurrencyPair <: FinancialAsset
    baseside::Currency
    quoteside::Currency
end

abstract FinancialID

type Ticker <: FinancialID
    id::UTF8String
end

type CUSIP <: FinancialID
    id::UTF8String
end

type BloombergID <: FinancialID
    id::UTF8String
end

type ReutersID <: FinancialID
     id::UTF8String
end

abstract AbstractCurrency

type Currency <: AbstractCurrency
    origin::UTF8String
end

############ const ################

const USD = Currency("USD")
const GBP = Currency("GBP")
const EUR = Currency("EUR")
const AUD = Currency("AUD")
const NZD = Currency("NZD")
const JPY = Currency("JPY")

const EURUSD = CurrencyPair(EUR,USD)
const EURJPY = CurrencyPair(EUR,JPY)
const AUDUSD = CurrencyPair(AUD,USD)
const NZDUSD = CurrencyPair(NZD,USD)
const GBPUSD = CurrencyPair(GBP,USD)
const USDJPY = CurrencyPair(USD,JPY)

const F = "Jan"
const G = "Feb"
const H = "Mar"
const J = "Apr"
const K = "May"
const M = "Jun"
const N = "Jul"
const Q = "Aug"
const U = "Sep"
const X = "Oct"
const V = "Nov"
const Z = "Dec"

############ show methods ################

function show(io::IO, c::CUSIP)
    print(io, @sprintf("%s", c.id))
end

function show(io::IO, c::ReutersID)
    print(io, @sprintf("%s", c.id))
end

function show(io::IO, c::BloombergID)
    print(io, @sprintf("%s", c.id))
end

function show(io::IO, t::Ticker)
    print(io, @sprintf("%s", t.id))
end

function show(io::IO, s::Stock)
    println(io, @sprintf("ticker:         %s", s.ticker))
    println(io, @sprintf("currency:       %s", s.currency))
    println(io, @sprintf("tick:           %s", s.tick))
    println(io, @sprintf("multiplier:     %s", s.multiplier))
end

function show(io::IO, c::Currency)
    print(io, @sprintf("%s", c.origin))
end

function show(io::IO, c::CurrencyPair)
    print(io, @sprintf("%s/%s", string(c.baseside), string(c.quoteside)))
end
