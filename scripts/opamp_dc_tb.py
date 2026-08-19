from ngspice_utils import *

import pandas as pd
import glob

raw_files = glob.glob("*.raw_*")

a_max_result    = [0.]*len(raw_files)
a_max_db_result = [0.]*len(raw_files)
vioff_result    = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    vp = Signal.get_signal("v(vp)")
    vp = Signal.ymax(vp)

    v_out = Signal.get_signal("v(out)")

    a_dc = Signal.derivative(v_out)

    a_max = Signal.ymax(a_dc)
    a_max_db = 20*np.log10(a_max)

    v_offset = Signal.cross(v_out, vp/2)

    print(f"a_max: {get_value_with_prefix(a_max)}")
    print(f"a_max_db: {get_value_with_prefix(a_max_db)}")
    print(f"v_offset: {get_value_with_prefix(v_offset)}")

    a_max_result[corner_number]     = a_max
    a_max_db_result[corner_number]  = a_max_db
    vioff_result[corner_number]     = v_offset

    plt.figure()
    plt.plot(Signal.get_x_axis(), v_out)
    plt.savefig(f"plot_{corner_number}.png")

data = {"a_max": a_max_result, 
        "a_max_db": a_max_db_result, 
        "vioff": vioff_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")
