v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 490 -300 490 -270 {lab=vp}
N 870 -300 870 -240 {lab=vp}
N 770 -10 780 -10 {lab=d1}
N 780 -10 780 10 {lab=d1}
N 770 10 780 10 {lab=d1}
N 770 10 770 20 {lab=d1}
N 830 -10 840 -10 {lab=d8}
N 840 -10 840 10 {lab=d8}
N 830 10 840 10 {lab=d8}
N 830 10 830 20 {lab=d8}
N 930 -160 990 -160 {lab=vref}
N 490 -300 870 -300 {lab=vp}
N 490 0 870 0 {lab=gd}
N 140 -300 140 -270 {lab=vp}
N 140 -300 490 -300 {lab=vp}
N 870 -80 870 0 {lab=gd}
N 830 -80 830 -10 {lab=d8}
N 490 -50 490 0 {lab=gd}
N 140 -70 140 0 {lab=gd}
N 140 0 490 0 {lab=gd}
N 280 -160 310 -160 {lab=d1}
N 310 -160 310 -30 {lab=d1}
N 480 -40 480 -30 {lab=d1}
N 480 -40 500 -40 {lab=d1}
N 500 -40 500 -30 {lab=d1}
N 770 -30 770 -10 {lab=d1}
N 500 -30 770 -30 {lab=d1}
N 770 -80 770 -30 {lab=d1}
N 0 -300 140 -300 {lab=vp}
N 0 0 140 0 {lab=gd}
N 310 -30 480 -30 {lab=d1}
N 280 -180 380 -180 {lab=su_gm}
N 650 -160 730 -160 {lab=vbias}
N 650 -200 650 -160 {lab=vbias}
N 620 -160 650 -160 {lab=vbias}
N 650 -200 670 -200 {lab=vbias}
C {/foss/designs/test/circuit/bandgap_res_core.sym} 730 -160 0 0 {name=xbandgap}
C {/foss/designs/test/circuit/const_gm_bias.sym} 400 -70 0 0 {name=xbias}
C {ipin.sym} 0 -300 0 0 {name=p1 lab=vp}
C {ipin.sym} 0 0 0 0 {name=p2 lab=gd}
C {opin.sym} 990 -160 0 0 {name=p3 lab=vref
}
C {opin.sym} 770 20 1 0 {name=p4 lab=d1
}
C {opin.sym} 830 20 1 0 {name=p5 lab=d8}
C {/foss/designs/test/circuit/bandgap_res_startup.sym} 140 -70 0 0 {name=xstartup}
C {lab_wire.sym} 350 -180 0 0 {name=p7 sig_type=std_logic lab=su_gm}
C {opin.sym} 670 -200 0 0 {name=p6 lab=vbias}
