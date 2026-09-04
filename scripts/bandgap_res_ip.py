from ngspice_utils import *

# parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/bandgap_res_tb/simulations/ip_bandgap_delta_v_tb.raw")

# v_vd1 = Signal.get_signal("v(vd1)")
# v_vd2 = Signal.get_signal("v(vd2)")

# v_delta_vbe = v_vd1 - v_vd2

# r_ip = v_delta_vbe/Signal.get_x_axis()

# Signal.plot(v_delta_vbe)
# Signal.plot(r_ip)

from mpl_toolkits.mplot3d import Axes3D as ax
parse_ngspice_raw("/Users/pjoter/Documents/magisterka/share_folder/master/simulations/temp-sweep.out")


v_vd1 = Signal.get_signal("v(vd1)")
v_vd_diff = Signal.get_signal("(v(vd1)-v(vd2))")
r_matrix = v_vd_diff/Signal.get_x_axis()

deriv_temp_vd_diff = np.gradient(v_vd_diff, Signal.get_sweep_axis(), axis=0)
deriv_temp_vd1 = np.gradient(v_vd1, Signal.get_sweep_axis(), axis=0)

ptat_ctat_ratio_matrix = deriv_temp_vd_diff / -deriv_temp_vd1

ptat_ctat_ratio_avg = np.average(ptat_ctat_ratio_matrix)
ctat_ptat_ratio_avg = 1/ptat_ctat_ratio_avg

print(f"ctat_ptat_ratio_avg: {ptat_ctat_ratio_avg}")
print(f"ptat_ctat_ratio_avg: {ctat_ptat_ratio_avg}")

v_vd1_at_25C = v_vd1[76]
rd_at_25C = r_matrix[76]
v_vd_diff_at25C = v_vd_diff[76]

total_bias_current = (v_vd_diff_at25C/rd_at_25C + v_vd1_at_25C/(ctat_ptat_ratio_avg*rd_at_25C))

interception_point = 100e-6

id_current = Signal.cross(total_bias_current, interception_point)

print(f"interception_point: {get_value_with_prefix(interception_point)}")
print(f"id_current: {get_value_with_prefix(id_current)}")

rd = Signal.value_at(rd_at_25C, id_current)
rsub = rd * ctat_ptat_ratio_avg

print(f"rd: {get_value_with_prefix(rd)}")
print(f"rsub: {get_value_with_prefix(rsub)}")

fig = plt.figure()
# plt.imshow(v_vd_diff, 
#            aspect='auto', 
#            extent=[min(Signal.get_x_axis()), max(Signal.get_x_axis()), min(Signal.get_sweep_axis()), max(Signal.get_sweep_axis())])
plt.pcolor(Signal.get_x_axis()*1e6, Signal.get_sweep_axis(), v_vd_diff)
# X, Y = np.meshgrid(Signal.get_x_axis()*1e6, Signal.get_sweep_axis())
# ax = fig.add_subplot(111, projection='3d')
# ax.plot_surface(X, Y, deriv_temp_vd1*1e3)
plt.xlabel("Prąd [$\\mu$A]")
plt.ylabel("Temperatura [$\\degree$C]")
plt.title("$\\Delta$Vbe w funckji \nprądu polaryzujacego oraz temperatury")
plt.colorbar()
plt.scatter(100, 25, c='red')

plt.figure()
plt.pcolor(Signal.get_x_axis()*1e6, Signal.get_sweep_axis(), ptat_ctat_ratio_matrix)
# X, Y = np.meshgrid(Signal.get_x_axis()*1e6, Signal.get_sweep_axis())
# ax = fig.add_subplot(111, projection='3d')
# ax.plot_surface(X, Y, deriv_temp_vd1*1e3)
plt.xlabel("Prąd [$\\mu$A]")
plt.ylabel("Temperatura [$\\degree$C]")
plt.title("Stosunek pradów PTAT do CTAT w funckji \nprądu polaryzujacego oraz temperatury")
plt.colorbar()
plt.scatter(100, 25, c='red')

# plt.plot(Signal.get_x_axis()*1e6, total_bias_current*1e3)
# plt.plot(Signal.get_x_axis()*1e6, ctat_ptat_ratio_matrix[76])
# plt.show()

plt.show()

v_vd1 = Signal.get_signal("v(vd1)#76")
v_vd2 = Signal.get_signal("v(vd2)#76")

v_vd2 = v_vd2 + rd * Signal.get_x_axis()

x_vd_ip, y_vd_ip = Signal.cross(v_vd1, v_vd2, return_y=True)

plt.figure()
plt.plot(Signal.get_x_axis()*1e6, v_vd1, label="v(vd1)@25$\\degree$C", c="blue")
plt.plot(Signal.get_x_axis()*1e6, v_vd2, label="v(vd2)@25$\\degree$C", c="red")
plt.xlabel("Prąd polaryzujacy diody [$\\mu$A]")
plt.ylabel("Napięcie diody [mV]")
plt.scatter(x_vd_ip*1e6, y_vd_ip, c="red")
plt.text(50, 0.75, f"ip:\n{x_vd_ip*1e6} uA\n{y_vd_ip*1e3} mV")
plt.title("Charakterystyka I-V diod oraz\npunkt przechwycenia (IP) @25$\\degree$C")
plt.legend()
plt.grid(True)
plt.show()