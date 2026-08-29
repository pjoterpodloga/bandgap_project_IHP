from ngspice_utils import *

import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

v_ref_result        = [0.]*len(raw_files)
t_setup_bg_result   = [0.]*len(raw_files)
t_setup_gm_result   = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    tend = Signal.get_x_axis()[-1]
    tend_meas = tend-10e-9

    v_vp = Signal.get_signal("v(vp)")
    v_ref = Signal.get_signal("v(out)")
    v_d1 = Signal.get_signal("v(vd1)")
    v_d8 = Signal.get_signal("v(vd8)")
    v_vcap = Signal.get_signal("v(xdut.xstartup.vcap)")
    v_vr = Signal.get_signal("v(xdut.xbias.vr)")
    v_bias = Signal.get_signal("v(vbias)")
    #v_vg = Signal.get_signal("v(xdut.xbandgap.vg)")

    vp = Signal.value_at(v_vp, tend_meas)

    v_ref_tend = Signal.value_at(v_ref, tend_meas)
    v_bias_tend = Signal.value_at(v_bias, tend_meas)

    t_delay = Signal.cross(v_vp, vp/2)

    t_ready_bg = Signal.cross(v_ref, v_ref_tend*0.95)
    t_ready_gm = Signal.cross(v_bias, v_bias_tend*0.95)

    t_setup_bg = t_ready_bg - t_delay
    t_setup_gm = t_ready_gm - t_delay

    v_ref_result[corner_number] = v_ref_tend
    t_setup_bg_result[corner_number] = t_setup_bg
    t_setup_gm_result[corner_number] = t_setup_gm

    plt.figure(tight_layout=True)
    plt.plot(Signal.get_x_axis()*1e6, v_vp)
    plt.plot(Signal.get_x_axis()*1e6, v_ref)
    plt.plot(Signal.get_x_axis()*1e6, v_bias)
    plt.plot(Signal.get_x_axis()*1e6, v_d1)
    plt.plot(Signal.get_x_axis()*1e6, v_d8)
    plt.plot(Signal.get_x_axis()*1e6, v_vcap)
    plt.plot(Signal.get_x_axis()*1e6, v_vr)
    plt.axhline(y=1.2, color='g', linestyle='--')
    plt.grid(True)
    plt.title("Symulacja rozruchu układu napięcia referencyjnego w czasie")
    plt.ylabel("Napięcie [V]")
    plt.xlabel("Czas [us]")
    plt.legend(["vp", "v_ref", "bias", "d1", "d8", "cap", "vr"])
    plt.savefig(f"plot_{corner_number}.png")


data = {"v_ref" : v_ref_result,
        "t_setup_bg": t_setup_bg_result,
        "t_setup_gm": t_setup_gm_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")