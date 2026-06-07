import matplotlib.pyplot as plt

from ngspice_utils import *

parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/bandgap_res_tb/simulations/const_gm_bias_res_tb.raw")

ibias_target = 10e-6

i_vr = Signal.get_signal("i(vr)")

r_bias = Signal.get_x_axis()/i_vr
vr_bias_target = Signal.cross(i_vr, ibias_target, at_range=[0, 600e-3])
r_bias_target = Signal.value_at(r_bias, vr_bias_target)

print(f"r_bias_target: {get_value_with_prefix(r_bias_target)}")

v_nbias = Signal.get_signal("v(nbias)")
v_pbias = Signal.get_signal("v(pbias)")
i_r1 = Signal.get_signal("i(xrbias:1)")
v_vr = Signal.get_signal("v(vr)")

print(f"nbias: {get_value_with_prefix(Signal.value_at(v_nbias))}")
print(f"pbias: {get_value_with_prefix(Signal.value_at(v_pbias))}")
print(f"ibias: {get_value_with_prefix(Signal.value_at(i_r1))}")
print(f"vr: {get_value_with_prefix(Signal.value_at(v_vr))}")

i_vicopy1 = Signal.get_signal("i(vicopy1)")
v_bias_copy1 = Signal.get_signal("v(bias_copy1)")
i_vicopy2 = Signal.get_signal("i(vicopy2)")
v_bias_copy2 = Signal.get_signal("v(bias_copy2)")

print(f"i_vicopy1: {get_value_with_prefix(Signal.value_at(i_vicopy1))}")
print(f"v_bias_copy1: {get_value_with_prefix(Signal.value_at(v_bias_copy1))}")
print(f"i_vicopy2: {get_value_with_prefix(Signal.value_at(i_vicopy2))}")
print(f"v_bias_copy2: {get_value_with_prefix(Signal.value_at(v_bias_copy2))}")

plt.figure()
Signal.plot(i_vr)
plt.grid(True)

plt.figure()
Signal.plot(i_vicopy1)
plt.grid(True)

plt.show()