from ngspice_utils import *

import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

vref_res_buf_result = [0.]*len(raw_files)
vref_sb_buf_result  = [0.]*len(raw_files)
p_supply_result     = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    tend = Signal.get_x_axis()[-1]
    tend_meas = tend-10e-9

    v_vp_18 = Signal.get_signal("v(vp_18)")
    v_vp_33 = Signal.get_signal("v(vp_33)")
    v_bias = Signal.get_signal("v(bias)")
    v_out = Signal.get_signal("v(out)")
    v_sel = Signal.get_signal("v(sel)")
    vref_res = Signal.get_signal("v(vref_res)")
    vref_sb = Signal.get_signal("v(vref_sb)")
    vg = Signal.get_signal("v(x1.vg)")
    v_buf = Signal.get_signal("v(x1.vbuf)")

    vref_res_buf = Signal.value_at(v_out, 10e-6)
    vref_sb_buf = Signal.value_at(v_out, 50e-6)

    vref_res_buf_result[corner_number] = vref_res_buf
    vref_sb_buf_result[corner_number] = vref_sb_buf

    plt.figure(tight_layout=True)
    plt.plot(Signal.get_x_axis()*1e6, v_sel)
    plt.plot(Signal.get_x_axis()*1e6, v_out)
    #plt.plot(Signal.get_x_axis()*1e6, vref_res)
    #plt.plot(Signal.get_x_axis()*1e6, vref_sb)
    plt.grid(True)
    plt.title("Symulacja czasowa rozruchu układu źródła napięcia referencyjnego")
    plt.ylabel("Napięcie [V]")
    plt.xlabel("Czas [us]")
    plt.savefig(f"plot_voltage_{corner_number}.png")


data = {"vref_res_buf" : vref_res_buf_result,
        "vref_sb_buf": vref_sb_buf_result,
        "p_supply" : p_supply_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")