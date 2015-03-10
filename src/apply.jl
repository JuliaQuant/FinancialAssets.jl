using Base.Test

function *(n::Int, asset::FinancialAsset)
    @test_throws ErrorException asset.contracts
end
