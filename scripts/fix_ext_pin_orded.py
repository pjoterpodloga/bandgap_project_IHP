#!/foss/tools/bin/python3

import sys
import shutil
import os.path

def print_help():
    print()
    print("Help message of script for adjusting extraction pins order")
    print("\tFirst argument should be schematic netlist")
    print("\tSecond argument should be extraction netlist")
    print()

def fix_pins_orded(sch_netlist_file, pex_netlist_file):
    if (not os.path.exists(sch_netlist_file)):
        print("Schematic file do not exist.")
        exit(-1)

    if (not os.path.exists(pex_netlist_file)):
        print("Extraction file do not exist.")
        exit(-1)

    print(f"Schematic netlist file: {sch_netlist_file}")
    print(f"Extraction netlist file: {pex_netlist_file}")

    shutil.copy(pex_netlist_file, pex_netlist_file+".fepo")
    print("Original pex file copied.")

    sch_lines = []

    try:
        file = open(sch_netlist_file, "r")
        for l in file:
            sch_lines.append(l)
        file.close()
    except FileNotFoundError as err:
        print(err)
    except:
        pass

    pex_lines = []

    try:
        file = open(pex_netlist_file, "r")
        for l in file:
            pex_lines.append(l)
        file.close()
    except FileNotFoundError as err:
        print(err)
    except:
        pass

    
    for it, line in enumerate(sch_lines):
        if line.lower().startswith(".subckt"):
            line = line.split()
            pins = line[2:]
            break

    print(f"Found {len(pins)} pins.")
    print(f"Pins: {pins}")


    for it, line in enumerate(pex_lines):
        if line.lower().startswith(".subckt"): 
            subckt_label = line.split()
            pex_lines[it] = subckt_label[0] + " " + subckt_label[1]
            for p in pins:
                pex_lines[it] = pex_lines[it] + f" {p}"
            pex_lines[it] = pex_lines[it] + "\n"
            break

    file = open(pex_netlist_file, "w")
    file.writelines(pex_lines)
    file.close()

    print("Pins orded fixed.")

    return

if __name__ == "__main__":

    if (len(sys.argv) < 3):
        print_help()
        exit(0)

    sch_netlist_file = sys.argv[1]
    pex_netlist_file = sys.argv[2]

    fix_pins_orded(sch_netlist_file, pex_netlist_file)

    print("Script executed succesfully.")

    exit(0)