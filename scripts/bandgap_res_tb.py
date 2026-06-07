from ngspice_utils import *

parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/master/simulations/bandgap_res_temp_tb.pex.raw")

v_ref = Signal.get_signal("v(v_ref)")
i_dr = Signal.get_signal("i(v.x1.vidr)")
i_ref = Signal.get_signal("i(v.x1.viref)")
v_vd = Signal.get_signal("v(x1.vd)")
v_vrd = Signal.get_signal("v(x1.vrd)")
v_vg = Signal.get_signal("v(x1.vg)")

deriv_i_dr = Signal.derivative(i_dr)
deriv_i_dr = Signal.value_at(deriv_i_dr, 25)

deriv_v_dr = Signal.derivative(v_vd)
deriv_v_dr = Signal.value_at(deriv_v_dr)

print(f"deriv_v_dr: {get_value_with_prefix(deriv_v_dr)}")

print(f"i_dr: {get_value_with_prefix(Signal.value_at(i_dr,25))}")
print(f"deriv_i_dr: {get_value_with_prefix(deriv_i_dr)}")

i_bias = Signal.get_signal("i(vibias)")

i_ref_max = Signal.ymax(i_ref)
i_ref_min = Signal.ymin(i_ref)
i_ref_sub = i_ref_max - i_ref_min 
print(f"i_ref_max: {get_value_with_prefix(i_ref_max)}")
print(f"i_ref_min: {get_value_with_prefix(i_ref_min)}")
print(f"i_ref_sub: {get_value_with_prefix(i_ref_sub)}")

v_ref_max = Signal.ymax(v_ref)
v_ref_min = Signal.ymin(v_ref)
v_ref_sub = v_ref_max - v_ref_min
print(f"v_ref_max: {get_value_with_prefix(v_ref_max)}")
print(f"v_ref_min: {get_value_with_prefix(v_ref_min)}")
print(f"v_ref_sub: {get_value_with_prefix(v_ref_sub)}")

tempco = 2 * v_ref_sub / (v_ref_max+v_ref_min) / 175 * 1e6

print(f"tempco:{get_value_with_prefix(tempco)} ppm/degC")


Signal.plot(v_vg)

plt.figure()
plt.plot(Signal.get_x_axis(), -i_bias*1e6)
plt.title("Prąd polaryzujący w funkcji temperatury")
plt.ylabel("Prąd [$\\mu$A]")
plt.xlabel("Temperatura [$\\degree$C]")
plt.grid(True)

Signal.plot([v_vd, v_vrd])
Signal.plot(i_dr*1e3)
Signal.plot(i_ref)

Signal.plot(v_ref)
plt.title("Generowane napięcie referencyje w funkcji temperatury")
plt.ylabel("Napięcie [V]")
plt.xlabel("Temperatura [$\\degree$C]")

plt.show()


parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/master/simulations/vp-sweep.pex.out")

v_ref = Signal.get_signal("v(v_ref)")

v_ref_max = np.max(v_ref, axis=1)
v_ref_min = np.min(v_ref, axis=1)

tcoeff = 2*(v_ref_max-v_ref_min)/(v_ref_max+v_ref_min) / 175 * 1e6

import pandas as pd

df = pd.DataFrame({
    "vp" : Signal.get_sweep_axis(),
    "max" : v_ref_max,
    "min" : v_ref_min,
    "tc" : tcoeff
})
df.to_csv("output.pex.csv")

for i, p in enumerate(v_ref):
    plt.plot(Signal.get_x_axis(), p, label=f"vp:{Signal.get_sweep_value(i)}[V]")

plt.xlabel("Temperatura [$\\degree$C]")
plt.ylabel("Generowane napiecie referencyjne [V]")
plt.legend()
plt.title("Generowane napięcie referencyje w funkcji temperatury\n" \
            "dla róznych napięć zasilania")
plt.xlim([-50, 125])
plt.grid(True)
plt.show()