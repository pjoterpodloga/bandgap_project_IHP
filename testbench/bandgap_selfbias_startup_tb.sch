v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 370 -350 370 -310 {lab=vp}
N 20 -130 20 -110 {lab=gd}
N 20 -50 20 -30 {lab=0}
N 20 -130 100 -130 {lab=gd}
N 20 -150 20 -130 {lab=gd}
N 100 -130 100 -110 {lab=gd}
N 100 -50 100 -30 {lab=sub!}
N 20 -230 20 -210 {lab=vp}
N 530 -230 530 -130 {lab=out}
N 370 -150 370 -30 {lab=gd}
N 530 -70 530 -30 {lab=gd}
N 430 -230 530 -230 {lab=out}
C {lab_wire.sym} 370 -350 3 0 {name=p3 sig_type=std_logic lab=vp}
C {netlist.sym} 0 -640 0 0 {name=s1 
value=
"
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerPNP.lib typ

.param xvp=1.8
.param xtemp=25
.param xdelay=200n

.save v(out)
.save v(vp)
.save i(vp)

.temp 'xtemp'

.tran 1n 3.2u uic
"}
C {vsource.sym} 20 -80 0 0 {name=VGD value=0 savecurrent=false}
C {lab_wire.sym} 20 -30 3 1 {name=p4 sig_type=std_logic lab=0}
C {vsource.sym} 100 -80 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 100 -30 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 80 -130 0 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 20 -230 3 0 {name=p6 sig_type=std_logic lab=vp}
C {vsource.sym} 20 -180 0 0 {name=VP
value="PWL(0 0 'xdelay' 0 'xdelay+1n' 'xvp')" 
savecurrent=false}
C {lab_wire.sym} 370 -30 3 1 {name=p8 sig_type=std_logic lab=gd}
C {capa.sym} 530 -100 0 0 {name=C1
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 530 -30 3 1 {name=p10 sig_type=std_logic lab=gd}
C {lab_wire.sym} 490 -230 0 0 {name=p12 sig_type=std_logic lab=out}
C {/foss/designs/test/circuit/bandgap_selfbias_core.sym} 230 -230 0 0 {name=x1}
