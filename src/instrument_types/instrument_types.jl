module InstrumentTypes

export Option, VanillaCallOption, payoff

abstract Option

type VanillaCallOption <: Option
    expiry
    strike
end

type VanillaPutOption <: Option
    expiry
    strike
end

payoff(option::VanillaCallOption, spot_price) = max(spot_price - option.strike, 0)
payoff(option::VanillaPutOption, spot_price) = max(option.strike - spot_price, 0)

end
