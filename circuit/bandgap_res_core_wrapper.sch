v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -300 160 -270 {lab=vp}
N 540 -300 540 -240 {lab=vp}
N 440 -10 450 -10 {lab=d1}
N 450 -10 450 10 {lab=d1}
N 440 10 450 10 {lab=d1}
N 440 10 440 20 {lab=d1}
N 500 -10 510 -10 {lab=d8}
N 510 -10 510 10 {lab=d8}
N 500 10 510 10 {lab=d8}
N 500 10 500 20 {lab=d8}
N 600 -160 660 -160 {lab=vref}
N 540 -80 540 0 {lab=gd}
N 500 -80 500 -10 {lab=d8}
N 160 -50 160 0 {lab=gd}
N 440 -80 440 -10 {lab=d1}
N 320 -160 400 -160 {lab=vbias}
N 320 -200 320 -160 {lab=vbias}
N 290 -160 320 -160 {lab=vbias}
N 320 -200 340 -200 {lab=vbias}
N 160 -300 540 -300 {lab=vp}
N 160 0 540 0 {lab=gd}
N 0 -300 160 -300 {lab=vp}
N 0 0 160 0 {lab=gd}
C {/foss/designs/test/circuit/bandgap_res_core.sym} 400 -160 0 0 {name=xbandgap}
C {/foss/designs/test/circuit/const_gm_bias.sym} 70 -70 0 0 {name=xbias}
C {ipin.sym} 0 -300 0 0 {name=p1 lab=vp}
C {ipin.sym} 0 0 0 0 {name=p2 lab=gd}
C {opin.sym} 660 -160 0 0 {name=p3 lab=vref
}
C {opin.sym} 440 20 1 0 {name=p4 lab=d1
}
C {opin.sym} 500 20 1 0 {name=p5 lab=d8}
C {opin.sym} 340 -200 0 0 {name=p6 lab=vbias}
