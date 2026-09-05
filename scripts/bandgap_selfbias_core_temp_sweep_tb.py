from ngspice_utils import *

import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

v_ref_min_result    = [0.]*len(raw_files)
v_ref_max_result    = [0.]*len(raw_files)
v_ref_sub_result    = [0.]*len(raw_files)
v_ref_avg_result    = [0.]*len(raw_files)
v_ref_at_25C_result = [0.]*len(raw_files)
temp_coeff_result   = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    v_ref = Signal.get_signal("v(v_ref)")

    v_ref_at_25C = Signal.value_at(v_ref, 25)
    v_ref_max = Signal.ymax(v_ref)
    v_ref_min = Signal.ymin(v_ref)
    v_ref_sub = np.abs(v_ref_max-v_ref_min)
    v_ref_avg = np.average(v_ref)
    v_ref_sub = v_ref_max - v_ref_min
    print(f"v_ref_max: {get_value_with_prefix(v_ref_max)}")
    print(f"v_ref_min: {get_value_with_prefix(v_ref_min)}")
    print(f"v_ref_sub: {get_value_with_prefix(v_ref_sub)}")

    temp_coeff = 2 * v_ref_sub / (v_ref_max+v_ref_min) / 175 * 1e6

    print(f"temp_coeff: {get_value_with_prefix(temp_coeff)} ppm/degC")

    T_min = Signal.xmin(v_ref)

    print(f"x of T_min: {get_value_with_prefix(T_min)} degC")

    v_ref_min_result[corner_number] = v_ref_min
    v_ref_max_result[corner_number] = v_ref_max
    v_ref_sub_result[corner_number] = v_ref_sub
    v_ref_avg_result[corner_number] = v_ref_avg
    v_ref_at_25C_result[corner_number] = v_ref_at_25C
    temp_coeff_result[corner_number] = temp_coeff

    # v_ref_40m   = Signal.value_at(v_ref, -40)
    # v_ref_25p   = Signal.value_at(v_ref, 25)
    # v_ref_120p  = Signal.value_at(v_ref, 120)

    plt.figure(tight_layout=True)
    plt.plot(Signal.get_x_axis(), v_ref)
    #plt.plot(Signal.get_x_axis(), v_vd)
    plt.grid(True)
    plt.title("Generowane napięcie referencyje w funkcji temperatury")
    plt.ylabel("Napięcie [V]")
    plt.xlabel("Temperatura [$\\degree$C]")
    plt.savefig(f"plot_{corner_number}.png")


data = {"v_ref_min" : v_ref_min_result, 
        "v_ref_max" : v_ref_max_result, 
        "v_ref_avg" : v_ref_avg_result,
        "v_ref_sub" : v_ref_sub_result,
        "v_ref_at_25C" : v_ref_at_25C_result,
        "temp_coeff" : temp_coeff_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")

# tuning_data = {
#     "v_ref_@40m"    : v_ref_40m,
#     "v_ref_@25p"    : v_ref_25p,
#     "v_ref_@120p"   : v_ref_120p,
#     "temp_coeff" : temp_coeff_result
# }
# tuning_df = pd.DataFrame(tuning_data)
# tuning_df.to_csv("tuning_data.csv")