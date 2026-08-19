from ngspice_utils import *

import pandas as pd
import glob

raw_files = glob.glob("*.raw_*")

i_bias_m45_result       = [0.]*len(raw_files)
i_bias_m25_result       = [0.]*len(raw_files)
i_bias_0_result         = [0.]*len(raw_files)
i_bias_p25_result       = [0.]*len(raw_files)
i_bias_p50_result       = [0.]*len(raw_files)
i_bias_p75_result       = [0.]*len(raw_files)
i_bias_p100_result      = [0.]*len(raw_files)
i_bias_p120_result      = [0.]*len(raw_files)
i_bias_spread_result    = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    i_bias = Signal.get_signal("i(vibias)")

    i_bias_m45  = Signal.value_at(i_bias, -45)
    i_bias_m25  = Signal.value_at(i_bias, -25)
    i_bias_0    = Signal.value_at(i_bias, 0)
    i_bias_p25  = Signal.value_at(i_bias, 25)
    i_bias_p50  = Signal.value_at(i_bias, 50)
    i_bias_p75  = Signal.value_at(i_bias, 75)
    i_bias_p100 = Signal.value_at(i_bias, 100)
    i_bias_p120 = Signal.value_at(i_bias, 120)

    i_bias_max  = Signal.ymax(i_bias)
    i_bias_min  = Signal.ymin(i_bias)

    i_bias_spread = np.abs(i_bias_max - i_bias_min)

    print(f"i_bias_m45: {get_value_with_prefix(i_bias_m45)}")
    print(f"i_bias_p25: {get_value_with_prefix(i_bias_p25)}")
    print(f"i_bias_p120: {get_value_with_prefix(i_bias_p120)}")

    i_bias_m45_result[corner_number]    = i_bias_m45
    i_bias_m25_result[corner_number]    = i_bias_m25
    i_bias_0_result[corner_number]      = i_bias_0
    i_bias_p25_result[corner_number]    = i_bias_p25
    i_bias_p50_result[corner_number]    = i_bias_p50
    i_bias_p75_result[corner_number]    = i_bias_p75
    i_bias_p100_result[corner_number]   = i_bias_p100
    i_bias_p120_result[corner_number]   = i_bias_p120
    i_bias_spread_result[corner_number] = i_bias_spread

    plt.figure()
    plt.plot(Signal.get_x_axis(), i_bias)
    plt.savefig(f"plot_{corner_number}.png")

data = {"i_bias_m45": i_bias_m45_result, 
        "i_bias_m25": i_bias_m25_result, 
        "i_bias_0": i_bias_0_result,
        "i_bias_p25" : i_bias_p25_result,
        "i_bias_p50" : i_bias_p50_result,
        "i_bias_p75" : i_bias_p75_result,
        "i_bias_p100" : i_bias_p100_result,
        "i_bias_p120" : i_bias_p120_result,
        "i_bias_spread_result" : i_bias_spread_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")
