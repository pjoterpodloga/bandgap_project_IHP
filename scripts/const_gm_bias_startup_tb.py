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

    i_bias = Signal.get_signal("i(vibias)")

    plt.figure()
    plt.plot(Signal.get_x_axis(), i_bias)
    plt.savefig(f"plot_{corner_number}.png")

data = {"i_res": i_res_result, "r_res": r_res_result, "i_out": i_out_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")
