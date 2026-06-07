from ngspice_utils import *

parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/bandgap_res_tb/simulations/opamp_ac_tb.raw")

v_out = Signal.get_signal("v(out)")
mag = Signal.magnitude(v_out)
mag_db = Signal.magnitude_db(v_out)
ph = Signal.phase_deg_unwrapped(v_out)


A_dc = Signal.value_at(mag_db)
f_3db = Signal.cross(mag_db, A_dc - 3)
f0 = Signal.cross(mag_db, 0)
pm = Signal.phase_margin_deg(v_out)

print(f"A_dc: {get_value_with_prefix(A_dc)}")
print(f"f_3db: {get_value_with_prefix(f_3db)}")
print(f"f0: {get_value_with_prefix(f0)}")
print(f"pm: {get_value_with_prefix(pm)}")

Signal.plot(mag_db)
Signal.plot(ph)
Signal.plot([mag_db, ph])

plt.show()

