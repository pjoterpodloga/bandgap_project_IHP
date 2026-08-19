#!/foss/tools/bin/python3

import sys
import shutil
import os.path

def print_help():
    print()
    print("Help message of script for adding small quiescent current to floating nodes")
    print("\tArgument should be filename of pex netlist")
    print()

def fix_floating_nodes(pex_netlist_file):

    print(f"Netlist file: {pex_netlist_file}")

    if (not os.path.exists(pex_netlist_file)):
        print("File do not exist.")
        exit(-1)

    shutil.copy(pex_netlist_file, pex_netlist_file+".fnr")
    print("Original file copied.")

    lines = []

    try:
        file = open(pex_netlist_file, "r")
        for l in file:
            lines.append(l)
        file.close()
    except FileNotFoundError as err:
        print(err)
    except:
        pass

    insert_line = []
    node_insert = []

    for it, line in enumerate(lines):
        if ("$ **FLOATING" in line and not "$ **ADDED BY SCRIPT" in lines[it-1]):
            insert_line.append(it)
            line = line.split()
            nodes = [line[1], line[2]]
            node_insert.append(nodes)

    print(f"Found {len(insert_line)} floating nodes.")

    for it in range(len(insert_line)-1, -1, -1):
        lines.insert(insert_line[it], f"RFSCRIPT{it} {node_insert[it][0]} {node_insert[it][1]} 1G $ **ADDED BY SCRIPT\n")

    file = open(pex_netlist_file, "w")
    file.writelines(lines)
    file.close()

    print("Floating nodes fixed.")

    return

if __name__ == "__main__":

    if (len(sys.argv) == 1):
        print_help()
        exit(0)

    pex_netlist_file = sys.argv[1]

    fix_floating_nodes(pex_netlist_file)

    print("Script executed succesfully.")

    exit(0)