from ngspice_utils import *

import pandas as pd
import glob

raw_files = glob.glob("*.raw_*")

v_ref_min_result    = [0.]*len(raw_files)
v_ref_max_result    = [0.]*len(raw_files)
v_ref_sub_result    = [0.]*len(raw_files)
v_ref_avg_result    = [0.]*len(raw_files)
v_ref_at_25C_result = [0.]*len(raw_files)
v_gate_min_result   = [0.]*len(raw_files)
v_gate_max_result   = [0.]*len(raw_files)
v_gate_avg_result   = [0.]*len(raw_files)
i_ref_max_result    = [0.]*len(raw_files)
i_ref_min_result    = [0.]*len(raw_files)
i_ref_avg_result    = [0.]*len(raw_files)
i_ref_at_25C_result = [0.]*len(raw_files)
temp_coeff_result   = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    v_ref = Signal.get_signal("v(v_ref)")
    #i_dr = Signal.get_signal("i(v.x1.vidr)")
    #i_ref = Signal.get_signal("i(v.x1.viref)")
    v_vd = Signal.get_signal("v(vd1)")
    v_vrd = Signal.get_signal("v(start_up)")
    v_vg = Signal.get_signal("v(x1.vg)")

    v_gate_min = Signal.ymin(v_vg)
    v_gate_max = Signal.ymax(v_vg)
    v_gate_avg = np.average(v_vg)

    #deriv_i_dr = Signal.derivative(i_dr)
    #deriv_i_dr = Signal.value_at(deriv_i_dr, 25)

    deriv_v_dr = Signal.derivative(v_vd)
    deriv_v_dr = Signal.value_at(deriv_v_dr)

    print(f"deriv_v_dr: {get_value_with_prefix(deriv_v_dr)}")

    #print(f"i_dr: {get_value_with_prefix(Signal.value_at(i_dr,25))}")
    #print(f"deriv_i_dr: {get_value_with_prefix(deriv_i_dr)}")

    i_bias = Signal.get_signal("i(vibias)")

    #i_ref_at_25C = Signal.value_at(i_ref, 25)
    #i_ref_max = Signal.ymax(i_ref)
    #i_ref_min = Signal.ymin(i_ref)
    #i_ref_avg = np.average(i_ref)
    #i_ref_sub = i_ref_max - i_ref_min
    #print(f"i_ref_max: {get_value_with_prefix(i_ref_max)}")
    #print(f"i_ref_min: {get_value_with_prefix(i_ref_min)}")
    #print(f"i_ref_sub: {get_value_with_prefix(i_ref_sub)}")

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

    print(f"temp_coeff:{get_value_with_prefix(temp_coeff)} ppm/degC")

    v_ref_min_result[corner_number] = v_ref_min
    v_ref_max_result[corner_number] = v_ref_max
    v_ref_sub_result[corner_number] = v_ref_sub
    v_ref_avg_result[corner_number] = v_ref_avg
    v_ref_at_25C_result[corner_number] = v_ref_at_25C
    v_gate_min_result[corner_number] = v_gate_min
    v_gate_max_result[corner_number] = v_gate_max
    v_gate_avg_result[corner_number] = v_gate_avg
    #i_ref_max_result[corner_number] = i_ref_max
    #i_ref_min_result[corner_number] = i_ref_min
    #i_ref_avg_result[corner_number] = i_ref_avg
    #i_ref_at_25C_result[corner_number] = i_ref_at_25C
    temp_coeff_result[corner_number] = temp_coeff

    plt.figure(tight_layout=True)
    plt.plot(Signal.get_x_axis(), v_ref)
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
        "v_gate_min" : v_gate_min_result,
        "v_gate_max" : v_gate_max_result,
        "v_gate_avg" : v_gate_avg_result,
        "i_ref_min" : i_ref_min_result,
        "i_ref_max" : i_ref_max_result,
        "i_ref_avg" : i_ref_avg_result,
        "i_ref_at_25C" : i_ref_at_25C_result,
        "temp_coeff" : temp_coeff_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")