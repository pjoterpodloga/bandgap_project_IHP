v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 260 -200 290 -200 {lab=vbias}
N 380 -230 380 -200 {lab=vp_18}
N 380 -230 390 -230 {lab=vp_18}
N 390 -250 390 -230 {lab=vp_18}
N 380 -250 390 -250 {lab=vp_18}
N 180 -350 180 -320 {lab=vp_33}
N 0 -350 180 -350 {lab=vp_33}
N 380 -40 380 -10 {lab=gd}
N 180 -10 380 -10 {lab=gd}
N 180 -160 180 -10 {lab=gd}
N 0 -10 180 -10 {lab=gd}
N 260 -240 600 -240 {lab=#net1}
N 440 -120 500 -120 {lab=#net2}
N 500 -220 500 -120 {lab=#net2}
N 500 -220 600 -220 {lab=#net2}
N 580 -200 600 -200 {lab=sel}
N 580 -180 600 -180 {lab=sel_n}
N 380 -10 780 -10 {lab=gd}
N 780 -130 780 -10 {lab=gd}
N 180 -350 780 -350 {lab=vp_33}
N 780 -350 780 -290 {lab=vp_33}
N 380 -340 380 -250 {lab=vp_18}
N 380 -400 380 -360 {lab=vp_18}
N -0 -400 380 -400 {lab=vp_18}
N 380 -340 390 -340 {lab=vp_18}
N 390 -360 390 -340 {lab=vp_18}
N 380 -360 390 -360 {lab=vp_18}
N 730 -320 730 -290 {lab=vbias}
N 820 -190 860 -190 {lab=vout}
C {/foss/designs/test/circuit/bandgap_selfbias_top.sym} 240 -120 0 0 {name=x1}
C {/foss/designs/test/circuit/bandgap_res_top.sym} 60 -240 0 0 {name=x2}
C {ipin.sym} 0 -350 0 0 {name=p1 lab=vp_33}
C {ipin.sym} 0 -10 0 0 {name=p2 lab=gd}
C {ipin.sym} 0 -400 0 0 {name=p5 lab=vp_18}
C {/foss/designs/test/circuit/bandgap_buf_core.sym} 600 -240 0 0 {name=x3}
C {ipin.sym} 580 -200 0 0 {name=p3 lab=sel}
C {ipin.sym} 580 -180 0 0 {name=p4 lab=sel_n}
C {lab_wire.sym} 280 -200 0 1 {name=p6 sig_type=std_logic lab=vbias}
C {lab_wire.sym} 730 -300 3 1 {name=p7 sig_type=std_logic lab=vbias}
C {opin.sym} 860 -190 0 0 {name=p8 lab=vout}
