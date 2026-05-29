v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 260 -20 260 0 {lab=gd}
N 260 -130 260 -80 {lab=vr}
N 100 -130 100 0 {lab=gd}
N 170 -160 220 -160 {lab=nbias}
N 100 -560 260 -560 {lab=vp}
N 20 -400 100 -400 {lab=vp}
N 260 -400 340 -400 {lab=vp}
N 260 -160 340 -160 {lab=gd}
N 20 -160 100 -160 {lab=gd}
N 140 -160 170 -160 {lab=nbias}
N 200 -400 200 -350 {lab=pbias}
N 200 -400 220 -400 {lab=pbias}
N 260 -370 260 -350 {lab=pbias}
N 260 -260 340 -260 {lab=gd}
N 20 -260 100 -260 {lab=gd}
N 160 -260 170 -260 {lab=nbias}
N 170 -260 170 -160 {lab=nbias}
N 170 -260 220 -260 {lab=nbias}
N 160 -310 160 -260 {lab=nbias}
N 140 -260 160 -260 {lab=nbias}
N 100 -310 160 -310 {lab=nbias}
N 100 -310 100 -290 {lab=nbias}
N 20 -500 100 -500 {lab=vp}
N 260 -500 340 -500 {lab=vp}
N 100 -240 100 -190 {lab=#net1}
N 260 -240 260 -190 {lab=#net2}
N 100 -370 100 -310 {lab=nbias}
N 260 -350 260 -290 {lab=pbias}
N 260 -470 260 -420 {lab=#net3}
N 100 -470 100 -420 {lab=#net4}
N 100 -560 100 -530 {lab=vp}
N 260 -560 260 -530 {lab=vp}
N 200 -350 260 -350 {lab=pbias}
N 190 -400 200 -400 {lab=pbias}
N 190 -450 190 -400 {lab=pbias}
N 190 -500 220 -500 {lab=pbias}
N 140 -500 190 -500 {lab=pbias}
N 140 -400 190 -400 {lab=pbias}
N 480 -400 560 -400 {lab=vp}
N 480 -500 560 -500 {lab=vp}
N 400 -400 440 -400 {lab=pbias}
N 400 -450 400 -400 {lab=pbias}
N 400 -500 440 -500 {lab=pbias}
N 480 -470 480 -430 {lab=#net5}
N 480 -560 480 -530 {lab=vp}
N 190 -450 250 -450 {lab=pbias}
N 190 -500 190 -450 {lab=pbias}
N 250 -460 250 -450 {lab=pbias}
N 250 -460 270 -460 {lab=pbias}
N 270 -460 270 -450 {lab=pbias}
N 270 -450 400 -450 {lab=pbias}
N 400 -500 400 -450 {lab=pbias}
N 260 -560 480 -560 {lab=vp}
N 480 -370 480 -320 {lab=ibias}
N 0 -560 100 -560 {lab=vp}
N 100 0 260 -0 {lab=gd}
N -0 0 100 0 {lab=gd}
C {lab_wire.sym} 260 -110 3 0 {name=p22 sig_type=std_logic lab=vr}
C {lab_wire.sym} 20 -400 0 1 {name=p13 sig_type=std_logic lab=vp}
C {lab_wire.sym} 340 -400 0 0 {name=p14 sig_type=std_logic lab=vp}
C {lab_wire.sym} 340 -160 0 0 {name=p15 sig_type=std_logic lab=gd}
C {lab_wire.sym} 20 -160 0 1 {name=p16 sig_type=std_logic lab=gd}
C {lab_wire.sym} 210 -160 2 1 {name=p19 sig_type=std_logic lab=nbias}
C {lab_wire.sym} 250 -350 2 1 {name=p20 sig_type=std_logic lab=pbias}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 120 -160 0 1 {name=M1
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 240 -160 0 0 {name=M3
l=2u
w=0.6u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 240 -400 0 0 {name=M7
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 120 -400 0 1 {name=M5
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 340 -260 0 0 {name=p33 sig_type=std_logic lab=gd}
C {lab_wire.sym} 20 -260 0 1 {name=p34 sig_type=std_logic lab=gd}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 120 -260 0 1 {name=M2
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 240 -260 0 0 {name=M4
l=2u
w=0.6u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} 20 -500 0 1 {name=p35 sig_type=std_logic lab=vp}
C {lab_wire.sym} 340 -500 0 0 {name=p36 sig_type=std_logic lab=vp}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 240 -500 0 0 {name=M8
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 120 -500 0 1 {name=M6
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 560 -400 0 0 {name=p23 sig_type=std_logic lab=vp}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 460 -400 0 0 {name=M9
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 560 -500 0 0 {name=p24 sig_type=std_logic lab=vp}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 460 -500 0 0 {name=M10
l=2u
w=0.6u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/rhigh.sym} 260 -50 0 0 {name=Rbias
w=0.5e-6
l=0.96e-6
model=rhigh
body=sub!
spiceprefix=X
b=5
m=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {ipin.sym} 0 -560 0 0 {name=p1 lab=vp}
C {ipin.sym} 0 0 0 0 {name=p2 lab=gd}
C {opin.sym} 480 -320 1 0 {name=p3 lab=ibias}
