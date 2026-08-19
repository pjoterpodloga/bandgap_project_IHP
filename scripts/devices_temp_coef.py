from ngspice_utils import *

parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/bandgap_res_tb/simulations/devices_temp_coeff.raw")


k_boltzman = 1.38e-23
q_charge = 1.602e-19
d_size_ratio = 8

vbe_change_ratio = k_boltzman / q_charge * np.log(d_size_ratio)
print(f"vbe_change_ratio: {get_value_with_prefix(vbe_change_ratio)}")


i_bias = Signal.get_signal("v(ibias_ref)")
i_bias = Signal.value_at(i_bias)

v_vd1 = Signal.get_signal("v(vd1)")
v_vdr1 = Signal.get_signal("v(vdr1)")
v_vdr2 = Signal.get_signal("v(vdr2)")

v_delta_vbe = (v_vdr1-v_vdr2)
v_vbe = v_vd1

deriv_v_delta_vbe = Signal.derivative(v_delta_vbe)
deriv_v_vbe = Signal.derivative(v_vbe)

print(f"deriv_v_delta_vbe: {get_value_with_prefix(deriv_v_delta_vbe)}")
print(f"deriv_v_vbe: {get_value_with_prefix(deriv_v_vbe)}")

ptat_ctat_ratio = 1/Signal.value_at(-Signal.derivative(v_vd1)/Signal.derivative(v_delta_vbe), 25)

print(f"ctat_ptat_ratio: {ptat_ctat_ratio}")

Signal.plot([v_vd1, v_delta_vbe])
plt.show()
 