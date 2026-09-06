from ngspice_utils import *

import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

a_dc_result     = [0.]*len(raw_files)
f_3db_result    = [0.]*len(raw_files)
f_0_result      = [0.]*len(raw_files)
pm_result       = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    vp = Signal.get_signal("v(vp)")
    vp = Signal.ymax(vp)

    v_out = Signal.get_signal("v(out)")

    v_out_mag = Signal.magnitude_db(v_out)
    v_out_phase = Signal.phase_deg_unwrapped(v_out)

    a_dc = Signal.value_at(v_out_mag, 10)

    f_3db = Signal.cross(v_out_mag, a_dc-3)
    f_0 = Signal.cross(v_out_mag, 0)
    pm = Signal.phase_margin_deg(v_out)

    print(f"a_dc: {get_value_with_prefix(a_dc)}")
    print(f"f_3db: {get_value_with_prefix(f_3db)}")
    print(f"f_0: {get_value_with_prefix(f_0)}")
    print(f"pm: {get_value_with_prefix(pm)}")

    a_dc_result[corner_number]   = a_dc
    f_3db_result[corner_number]  = f_3db
    f_0_result[corner_number]    = f_0
    pm_result[corner_number]     = pm

    plt.figure()
    plt.semilogx(Signal.get_x_axis(), v_out_mag)
    plt.semilogx(Signal.get_x_axis(), v_out_phase)
    plt.grid(True)
    plt.savefig(f"plot_{corner_number}.png")

data = {"a_dc": a_dc_result, 
        "f_3db": f_3db_result, 
        "f_0": f_0_result,
        "pm": pm_result,}
df = pd.DataFrame(data)
df.to_csv("measure.csv")
