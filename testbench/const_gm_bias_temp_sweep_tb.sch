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
N 540 -190 600 -190 {lab=out}
N 600 -190 600 -160 {lab=out}
N 600 -100 600 -40 {lab=gd}
C {/foss/designs/test/circuit/const_gm_bias.sym} 320 -100 0 0 {name=x1}
C {lab_wire.sym} 410 -340 3 0 {name=p1 sig_type=std_logic lab=vp}
C {lab_wire.sym} 410 -70 3 0 {name=p2 sig_type=std_logic lab=gd}
C {vsource.sym} 120 -170 0 0 {name=VP value='xvp' savecurrent=true}
C {vsource.sym} 120 -70 0 0 {name=VP1 value='xvp' savecurrent=false}
C {vsource.sym} 40 -70 0 0 {name=VP2 value='xvp' savecurrent=false}
C {lab_wire.sym} 40 -30 3 0 {name=p3 sig_type=std_logic lab=sub!}
C {lab_wire.sym} 120 -30 3 0 {name=p4 sig_type=std_logic lab=0}
C {lab_wire.sym} 90 -120 0 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 120 -210 3 1 {name=p6 sig_type=std_logic lab=vp}
C {vsource.sym} 600 -130 0 0 {name=VIBIAS value=0 savecurrent=true}
C {lab_wire.sym} 600 -80 3 0 {name=p7 sig_type=std_logic lab=gd}
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
C {lab_wire.sym} 590 -190 0 0 {name=p8 sig_type=std_logic lab=out}
