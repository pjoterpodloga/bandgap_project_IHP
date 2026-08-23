v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 410 -340 410 -300 {lab=vp}
N 410 -80 410 -40 {lab=gd}
N 120 -120 120 -100 {lab=gd}
N 120 -40 120 -0 {lab=0}
N 120 -240 120 -200 {lab=vp}
N 120 -140 120 -120 {lab=gd}
N 40 -120 120 -120 {lab=gd}
N 40 -120 40 -100 {lab=gd}
N 40 -40 40 -0 {lab=sub!}
N 540 -230 700 -230 {lab=out}
N 700 -100 700 -40 {lab=gd}
N 700 -230 700 -160 {lab=out}
N 540 -210 620 -210 {lab=nbias}
N 620 -210 620 -160 {lab=nbias}
N 620 -100 620 -40 {lab=gd}
N 780 -100 780 -40 {lab=gd}
N 540 -250 780 -250 {lab=pbias}
N 780 -250 780 -160 {lab=pbias}
C {/foss/designs/test/circuit/const_gm_bias.sym} 320 -100 0 0 {name=x1}
C {lab_wire.sym} 410 -340 3 0 {name=p1 sig_type=std_logic lab=vp}
C {lab_wire.sym} 410 -40 3 0 {name=p2 sig_type=std_logic lab=gd}
C {vsource.sym} 120 -170 0 0 {name=VP value='xvp' savecurrent=true}
C {vsource.sym} 120 -70 0 0 {name=VP1 value='xvp' savecurrent=false}
C {vsource.sym} 40 -70 0 0 {name=VP2 value='xvp' savecurrent=false}
C {lab_wire.sym} 40 -30 3 0 {name=p3 sig_type=std_logic lab=sub!}
C {lab_wire.sym} 120 -30 3 0 {name=p4 sig_type=std_logic lab=0}
C {lab_wire.sym} 90 -120 0 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 120 -210 3 1 {name=p6 sig_type=std_logic lab=vp}
C {vsource.sym} 700 -130 0 0 {name=VIBIAS value=0 savecurrent=true}
C {lab_wire.sym} 700 -40 3 0 {name=p7 sig_type=std_logic lab=gd}
C {netlist.sym} 20 -530 0 0 {name=s1 
value="
.LIB cornerMOShv.lib mos_tt
.LIB cornerRES.lib res_typ
.LIB cornerPNP.lib typ

.SAVE i(vibias)
.SAVE i(vp)
.param xvp=3.3
.param xtemp=25

.temp 'xtemp'

.global sub!

.dc temp -55 125 0.1
"}
C {lab_wire.sym} 610 -230 0 0 {name=p8 sig_type=std_logic lab=out}
C {capa.sym} 620 -130 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 620 -40 3 0 {name=p9 sig_type=std_logic lab=gd}
C {capa.sym} 780 -130 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 780 -40 3 0 {name=p10 sig_type=std_logic lab=gd}
C {lab_wire.sym} 610 -210 0 0 {name=p11 sig_type=std_logic lab=nbias}
C {lab_wire.sym} 610 -250 0 0 {name=p12 sig_type=std_logic lab=pbias}
