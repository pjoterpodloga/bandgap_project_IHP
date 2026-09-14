from ngspice_utils import *

import pandas as pd
import glob

def sorter(item):
    corner_num = int(item.split("_")[-1])
    return corner_num

raw_files = sorted(glob.glob("*.raw_*"), key=sorter)

vioff_result    = [0.]*len(raw_files)

for rw in raw_files:

    corner_number = int(rw.split("_")[-1])

    print()
    print(f"Corner #{corner_number}")

    parse_ngspice_raw(rw)

    vp = Signal.get_signal("v(vp)")
    vp = Signal.ymax(vp)

    v_out = Signal.get_signal("v(out)")

    v_offset = Signal.cross(v_out, vp/2)

    vioff_result[corner_number] = v_offset

    plt.figure()
    plt.plot(Signal.get_x_axis(), v_out)
    plt.savefig(f"plot_{corner_number}.png")

for it_vr in range(len(vioff_result)):
    vioff_result[it_vr] = np.abs(vioff_result[it_vr]) * 1.0e6

v_offset_avg = np.mean(vioff_result)
v_offset_std = np.std(vioff_result)
v_offset_max = np.max(vioff_result)
v_offset_min = np.min(vioff_result)

max_sigma = int(np.floor(np.abs((v_offset_max - v_offset_avg)/v_offset_std)))
min_sigma = int(np.floor(np.abs((v_offset_min - v_offset_avg)/v_offset_std)))

print(f"Wartość średnia vioff: {v_offset_avg}")
print(f"Odchylenie standardowe vioff: {v_offset_std}")

plt.figure(tight_layout=True)
plt.hist(vioff_result, bins=10, edgecolor="black")

for it_ms in range(max_sigma):
    index = it_ms + 1
    plt.axvline(x=v_offset_avg+index*v_offset_std, color='red', linestyle='--')
    plt.text(v_offset_avg+index*v_offset_std, 0.5, f"{index}$\\sigma$", transform=plt.gca().get_xaxis_transform(), ha="center", va="center")
for it_ms in range(min_sigma):
    index = it_ms + 1
    plt.axvline(x=v_offset_avg-index*v_offset_std, color='red', linestyle='--')
    plt.text(v_offset_avg-index*v_offset_std, 0.5, f"{index}$\\sigma$", transform=plt.gca().get_xaxis_transform(), ha="center", va="center")

plt.grid(True)
plt.title("Histogram rozrzutu wejściowego napięcia niezrównoważenia")
plt.ylabel("Ilość próbek")
plt.xlabel("Napięcie [$\\mu$V]")

plt.text(
    0.02, 0.98,
    f"Średnia = {v_offset_avg:.3f} $\\mu$V\n"
    f"Odchylenie\nstandardowe = {v_offset_std:.3f} $\\mu$V",
    transform=plt.gca().transAxes,
    ha="left",
    va="top",
    bbox=dict(
        boxstyle="round",
        facecolor="white",
        edgecolor="black"
    )
)

plt.savefig("histogram_vioffset.png")

data = {"vioff": vioff_result}
df = pd.DataFrame(data)
df.to_csv("measure.csv")
