from ngspice_utils import *

import numpy as np
import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

def read_corner_list():
    file_content = None
    with open("corners.list", "r") as f:
        file_content = f.readlines()

    splited_file = [None]*len(file_content)

    for it_l, l in enumerate(file_content):
        l = l.replace("\n", "")
        splited_file[it_l] = l.split(" ")
        for it_sf, sf in enumerate(splited_file[it_l]):
            pass

    libs_params = []
    mc_quant = None
    line_counter = 0
    while True:
        if splited_file[line_counter][0] == "0:":
            break
        if splited_file[line_counter][0] == "lib" or splited_file[line_counter][0] == "param":
            libs_params.append(splited_file[line_counter][1])
        if splited_file[line_counter][0] == "mc" or splited_file[line_counter][0] == "monte_carlo":
            mc_quant = int(splited_file[line_counter][1])
        
        line_counter = line_counter + 1

    libs_params_map = {lp: it_lp for it_lp, lp in enumerate(libs_params)}

    corners = splited_file[line_counter:]

    for it_c in range(len(corners)):
        corners[it_c] = corners[it_c][1:]

    return [libs_params_map, corners, mc_quant]

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

corner_list = read_corner_list()
#lib_index = corner_list[0]["cornerMOShv.lib"]
#lib_index = corner_list[0]["cornerRES.lib"]
#lib_index = corner_list[0]["cornerPNP.lib"]
lib_index = corner_list[0]["xvp"]

v_ref_list = [None]*len(raw_files)
lib_corner = [None]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])
    print(f"Corner number: #{corner_number}")

    parse_ngspice_raw(rw)

    v_ref_list[corner_number] = Signal.get_signal("v(v_ref)")

    lib_corner[corner_number] = corner_list[1][corner_number][lib_index]

plt.figure(tight_layout=True)
for it_c in range(len(lib_corner)):

    v_ref = v_ref_list[it_c]
    lc = lib_corner[it_c]
    if lc == "mos_tt":
        plt.plot(Signal.get_x_axis(), v_ref, color='g', linestyle='-')
    if lc == "mos_ss":
        plt.plot(Signal.get_x_axis(), v_ref, color='b', linestyle='-')
    if lc == "mos_ff":
        plt.plot(Signal.get_x_axis(), v_ref, color='r', linestyle='-')
    if lc == "mos_fs":
        plt.plot(Signal.get_x_axis(), v_ref, color='orange', linestyle='-')
    if lc == "mos_sf":
        plt.plot(Signal.get_x_axis(), v_ref, color='orange', linestyle='--')

    if lc == "res_typ":
        plt.plot(Signal.get_x_axis(), v_ref, color='g', linestyle='-')
    if lc == "res_bcs":
        plt.plot(Signal.get_x_axis(), v_ref, color='b', linestyle='-')
    if lc == "res_wcs":
        plt.plot(Signal.get_x_axis(), v_ref, color='r', linestyle='-')

    if lc == "1.8":
        plt.plot(Signal.get_x_axis(), v_ref, color='g', linestyle='-')
    if lc == "1.62":
        plt.plot(Signal.get_x_axis(), v_ref, color='b', linestyle='-')
    if lc == "1.98":
        plt.plot(Signal.get_x_axis(), v_ref, color='r', linestyle='-')

    if lc == "typ":
        plt.plot(Signal.get_x_axis(), v_ref, color='g', linestyle='-')
    if lc == "bcs":
        plt.plot(Signal.get_x_axis(), v_ref, color='b', linestyle='-')
    if lc == "wcs":
        plt.plot(Signal.get_x_axis(), v_ref, color='r', linestyle='-')

mos_legend_elements = [
    plt.Line2D([0], [0], color='g', linestyle='-',  label="mos_tt"),
    plt.Line2D([0], [0], color='b', linestyle='-',  label="mos_ss"),
    plt.Line2D([0], [0], color='r', linestyle='-',  label="mos_ff"),
    plt.Line2D([0], [0], color='orange', linestyle='-',  label="mos_fs"),
    plt.Line2D([0], [0], color='orange', linestyle='--',  label="mos_sf"),
]
res_legend_elements = [
    plt.Line2D([0], [0], color='g', linestyle='-',  label="res_typ"),
    plt.Line2D([0], [0], color='b', linestyle='-',  label="res_bcs"),
    plt.Line2D([0], [0], color='r', linestyle='-',  label="res_wcs"),
]
bjt_legend_elements = [
    plt.Line2D([0], [0], color='g', linestyle='-',  label="dio_typ"),
    plt.Line2D([0], [0], color='b', linestyle='-',  label="dio_bcs"),
    plt.Line2D([0], [0], color='r', linestyle='-',  label="dio_wcs"),
]
vp_legend_elements = [
    plt.Line2D([0], [0], color='g', linestyle='-',  label="1.8V"),
    plt.Line2D([0], [0], color='b', linestyle='-',  label="1.62V"),
    plt.Line2D([0], [0], color='r', linestyle='-',  label="1.98V"),
]

plt.legend(handles=vp_legend_elements, 
           title="Napięcie zasilania",
           loc="upper left", 
           bbox_to_anchor=(0.05, 0.8))
plt.grid(True)
plt.title("Generowane napięcie referencyje w funkcji temperatury")
plt.ylabel("Napięcie [V]")
plt.xlabel("Temperatura [$\\degree$C]")
plt.savefig(f"plot_summary.png")
