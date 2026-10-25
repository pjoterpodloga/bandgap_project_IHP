v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 140 -130 160 -130 {lab=#net1}
N 140 -280 160 -280 {lab=#net1}
N 220 -130 240 -130 {lab=t2}
N 220 -280 240 -280 {lab=t2}
N 190 -280 190 -220 {lab=gd}
N 190 -200 190 -130 {lab=vp}
N 190 -90 190 -60 {lab=en_n}
N 140 -60 190 -60 {lab=en_n}
N 190 -360 190 -320 {lab=en}
N 140 -360 190 -360 {lab=en}
N 140 -200 140 -130 {lab=#net1}
N 240 -200 240 -130 {lab=t2}
N 100 -200 140 -200 {lab=#net1}
N 140 -280 140 -200 {lab=#net1}
N 240 -200 280 -200 {lab=t2}
N 240 -280 240 -200 {lab=t2}
N 140 -400 190 -400 {lab=gd}
N 140 -420 190 -420 {lab=vp}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 190 -300 1 0 {name=M1
l=0.9u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 190 -110 3 0 {name=M2
l=0.9u
w=1.2u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 190 -240 3 0 {name=p1 sig_type=std_logic lab=gd}
C {lab_wire.sym} 190 -180 1 0 {name=p2 sig_type=std_logic lab=vp}
C {ipin.sym} 140 -60 0 0 {name=p5 lab=en_n
}
C {ipin.sym} 140 -360 0 0 {name=p6 lab=en}
C {ipin.sym} 140 -420 0 0 {name=p7 lab=vp}
C {ipin.sym} 140 -400 0 0 {name=p8 lab=gd}
C {iopin.sym} 280 -200 0 0 {name=p9 lab=t2}
C {iopin.sym} 100 -200 0 1 {name=p3 lab=t1}
