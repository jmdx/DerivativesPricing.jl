module SimpleMC

using ..InstrumentTypes
export get_option_price

function get_option_price(option,spot,volatility,r,num_paths)
    expiry = option.expiry
    strike = option.strike
    variance = volatility * volatility * expiry
    root_variance = sqrt(variance)
    ito_correction = -0.5 * variance

    moved_spot = spot * exp(r * expiry + ito_correction)
    running_sum = 0.0

    for i = 1:num_paths
        this_spot = moved_spot * exp(root_variance * randn())
        running_sum += payoff(option, this_spot)
    end

    mean = running_sum / num_paths
    mean *= exp(-r * expiry)
    return mean
end

end
