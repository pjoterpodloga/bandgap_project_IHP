v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 170 -10 510 -10 {}
L 4 170 -460 510 -460 {}
L 4 170 -460 170 -10 {}
L 4 510 -460 510 -10 {}
L 4 510 -460 510 -10 {}
T {Diode biasing} 180 -450 0 0 0.4 0.4 {}
N 110 -60 110 -30 {lab=gd}
N 110 -200 110 -120 {lab=ibias_ref}
N 30 -200 30 -120 {lab=gd}
N 30 -60 30 -30 {lab=0}
N 30 -290 30 -260 {lab=vp}
N 290 -60 290 -30 {lab=gd}
N 230 -90 250 -90 {lab=gd}
N 230 -90 230 -30 {lab=gd}
N 230 -30 290 -30 {lab=gd}
N 440 -60 440 -30 {lab=gd}
N 380 -90 400 -90 {lab=gd}
N 380 -90 380 -30 {lab=gd}
N 380 -30 440 -30 {lab=gd}
N 290 -330 290 -120 {lab=vd1}
N 440 -330 440 -120 {lab=vd2}
N 220 -340 250 -340 {lab=gd}
N 220 -380 250 -380 {lab=ibias_ref}
N 290 -420 290 -390 {lab=vp}
N 440 -420 440 -390 {lab=vp}
N 370 -380 400 -380 {lab=ibias_ref}
N 370 -340 400 -340 {lab=gd}
N 110 -290 110 -260 {lab=vp}
C {isource.sym} 110 -230 0 0 {name=Ibias value=xibias}
C {res.sym} 110 -90 0 0 {name=Rref
value=1
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 110 -190 3 0 {name=p1 sig_type=std_logic lab=ibias_ref}
C {vsource.sym} 30 -90 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} 30 -230 0 0 {name=V2 value=xvp savecurrent=false}
C {lab_wire.sym} 30 -290 3 0 {name=p2 sig_type=std_logic lab=vp}
C {lab_wire.sym} 30 -50 3 0 {name=p3 sig_type=std_logic lab=0}
C {lab_wire.sym} 30 -190 3 0 {name=p4 sig_type=std_logic lab=gd}
C {sg13cmos5l_pr/pnpMPA.sym} 270 -90 0 0 {name=Q1
model=pnpMPA
spiceprefix=X
w=2.0e-6
l=2.0e-6
m=1
}
C {sg13cmos5l_pr/pnpMPA.sym} 420 -90 0 0 {name=Q2
model=pnpMPA
spiceprefix=X
w=2.0e-6
l=2.0e-6
m=8
}
C {lab_wire.sym} 110 -50 3 0 {name=p6 sig_type=std_logic lab=gd}
C {lab_wire.sym} 230 -50 3 0 {name=p7 sig_type=std_logic lab=gd
}
C {lab_wire.sym} 380 -50 3 0 {name=p8 sig_type=std_logic lab=gd}
C {vccs.sym} 290 -360 0 0 {name=G1 value=1}
C {vccs.sym} 440 -360 0 0 {name=G2 value=1}
C {lab_wire.sym} 290 -410 3 0 {name=p9 sig_type=std_logic lab=vp}
C {lab_wire.sym} 440 -410 3 0 {name=p10 sig_type=std_logic lab=vp}
C {lab_wire.sym} 240 -340 0 0 {name=p11 sig_type=std_logic lab=gd}
C {lab_wire.sym} 390 -340 0 0 {name=p12 sig_type=std_logic lab=gd}
C {lab_wire.sym} 240 -380 0 0 {name=p13 sig_type=std_logic lab=ibias_ref}
C {lab_wire.sym} 390 -380 0 0 {name=p14 sig_type=std_logic lab=ibias_ref}
C {lab_wire.sym} 290 -320 3 0 {name=p15 sig_type=std_logic lab=vd1}
C {lab_wire.sym} 440 -320 3 0 {name=p16 sig_type=std_logic lab=vd2}
C {lab_wire.sym} 110 -290 3 0 {name=p42 sig_type=std_logic lab=vp}
C {netlist.sym} 10 -750 0 0 {name=s1 
value=
"
.lib cornerPNP.lib typ

.param xvp=3.3
.param xibias=100u

.param xtemp=25

.save all

.temp 'xtemp'
.dc Ibias 5u 200u 0.25u
"}
