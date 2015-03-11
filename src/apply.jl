function *(n::Int, asset::FinancialAsset)
    if typeof(asset) == Stock || LongStock || ShortStock
        asset.shares = asset.shares * n
    else
        asset.contracts = asset.contracts * n
    end
    asset
end
