type AssetSpread <: FinancialAsset
    first::FinancialAsset
    second::FinancialAsset
    risk::Float64
end
