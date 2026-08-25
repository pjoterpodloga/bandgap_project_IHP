from ngspice_utils import *

import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

i_res_result = [0.]*len(raw_files)
r_res_result = [0.]*len(raw_files)
i_out_result = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    bias_point = 0.1

    i_res = Signal.get_signal("i(vres)")
    i_out = Signal.get_signal("i(vibias)")

    r_res = Signal.get_x_axis() / i_res

    i_res_at_bias = Signal.value_at(i_res, bias_point)
    i_out_at_bias = Signal.value_at(i_out, bias_point)
    r_res_at_bias = Signal.value_at(r_res, bias_point)

    print(f"i_res: {get_value_with_prefix(i_res_at_bias)}")
    print(f"i_out: {get_value_with_prefix(i_out_at_bias)}")
    print(f"r_res: {get_value_with_prefix(r_res_at_bias)}")

    i_res_result[corner_number] = i_res_at_bias
    r_res_result[corner_number] = r_res_at_bias
    i_out_result[corner_number] = i_out_at_bias

    plt.figure()
    plt.plot(Signal.get_x_axis(), i_res)
    plt.savefig(f"plot_{corner_number}.png")

data = {"i_res": i_res_result, "r_res": r_res_result, "i_out": i_out_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")
