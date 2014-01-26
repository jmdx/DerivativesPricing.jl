include("../../src/DerivativesPricing.jl")
using DerivativesPricing.SimpleMC
using DerivativesPricing.InstrumentTypes

is_close(x, y) = (abs(x - y) < 0.00001)
@assert is_close(get_option_price(VanillaCallOption(1,1), 1, 0, 0, 1000), 0)