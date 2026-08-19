#!/foss/tools/bin/python3

import sys
import shutil
import os.path

from fix_ext_pin_orded import fix_pins_orded
from float_node_res import fix_floating_nodes

def print_help():
    print()
    print("Help message of script for adjusting extraction pins order")
    print("\tFirst argument should be schematic netlist")
    print("\tSecond argument should be extraction netlist")
    print()

if __name__ == "__main__":

    if (len(sys.argv) < 3):
        print_help()
        exit(0)

    sch_netlist_file = sys.argv[1]
    pex_netlist_file = sys.argv[2]

    fix_pins_orded(sch_netlist_file, pex_netlist_file)
    fix_floating_nodes(sch_netlist_file)

    exit(0)