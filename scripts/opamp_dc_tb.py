from ngspice_utils import *

parse_ngspice_raw("../simulations/opamp_dc_tb.raw")

v_out = Signal.get_signal("v(out)")

vioff = Signal.cross(v_out, 1)

print(f"vioff: {get_value_with_prefix(vioff)}")

deriv_v_out = Signal.derivative(v_out)

A0 = Signal.ymax(deriv_v_out)
A_xmax = Signal.xmax(deriv_v_out)

print(f"A0 [V/V]: {get_value_with_prefix(A0)}")
print(f"A0 [dB]: {get_value_with_prefix(20*np.log10(A0))}")
print(f"A_xmax: {get_value_with_prefix(A_xmax)}")

import matplotlib.pyplot as plt

plt.figure()
plt.plot(Signal.get_x_axis()*1e3, v_out)
plt.xlabel("Różnicowe napięcie wejściowe [mV]")
plt.ylabel("Napięcie wyjściowe [V]")
plt.title("Charakterystyka przejściowa\nwzmacniacza operacyjnego")
plt.grid(True)

plt.figure()
plt.plot(Signal.get_x_axis()*1e3, deriv_v_out)
plt.xlabel("Różnicowe napięcie wejściowe [mV]")
plt.ylabel("Wzmocnienie [V/V]")
plt.title("Charakterystyka wzmocnienia\nwzmacniacza operacyjnego")
plt.grid(True)
plt.show()