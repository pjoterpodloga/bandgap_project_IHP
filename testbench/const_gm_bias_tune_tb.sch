v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 120 -100 120 -80 {lab=gd}
N 40 -100 120 -100 {lab=gd}
N 120 -120 120 -100 {lab=gd}
N 40 -100 40 -80 {lab=gd}
N 40 -20 40 -0 {lab=sub!}
N 120 -20 120 -0 {lab=0}
N 120 -200 120 -180 {lab=vp}
N 300 -240 300 -220 {lab=vp}
N 300 -100 300 -80 {lab=gd}
N 400 -100 400 -80 {lab=res}
N 400 -20 400 -0 {lab=gd}
N 680 -20 680 0 {lab=gd}
N 460 -180 680 -180 {lab=ibias}
N 460 -160 600 -160 {lab=nbias}
N 460 -140 520 -140 {lab=nbias}
N 520 -140 520 -80 {lab=nbias}
N 520 -20 520 0 {lab=gd}
N 600 -20 600 0 {lab=gd}
N 600 -160 600 -80 {lab=nbias}
N 680 -180 680 -80 {lab=ibias}
C {/foss/designs/test/circuit/const_gm_bias_core.sym} 260 -160 0 0 {name=x1}
C {vsource.sym} 120 -150 0 0 {name=VP value='xvp' savecurrent=true}
C {vsource.sym} 120 -50 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 40 -50 0 0 {name=VSUB value=0 savecurrent=false}
C {lab_wire.sym} 120 0 3 0 {name=p1 sig_type=std_logic lab=0}
C {lab_wire.sym} 40 0 3 0 {name=p2 sig_type=std_logic lab=sub!}
C {lab_wire.sym} 90 -100 0 0 {name=p3 sig_type=std_logic lab=gd}
C {lab_wire.sym} 120 -190 3 1 {name=p4 sig_type=std_logic lab=vp}
C {lab_wire.sym} 300 -230 3 1 {name=p5 sig_type=std_logic lab=vp}
C {lab_wire.sym} 300 -90 3 0 {name=p6 sig_type=std_logic lab=gd}
C {vsource.sym} 400 -50 0 0 {name=Vres value=0 savecurrent=true}
C {lab_wire.sym} 400 -90 3 0 {name=p7 sig_type=std_logic lab=res}
C {lab_wire.sym} 400 0 3 0 {name=p8 sig_type=std_logic lab=gd}
C {vsource.sym} 680 -50 0 0 {name=Vibias value=0 savecurrent=true}
C {lab_wire.sym} 680 0 3 0 {name=p9 sig_type=std_logic lab=gd}
C {netlist.sym} 20 -470 0 0 {name=s1 
value="
.LIB cornerMOShv.lib mos_tt
.LIB cornerRES.lib res_typ
.LIB cornerPNP.lib typ
.SAVE i(vibias)
.SAVE i(vres)
.PARAM xvp=3.3
.PARAM xtemp=25
.PROBE v(res)
.PROBE v(out)
.GLOBAL sub!
.TEMP 'xtemp'
.DC vres 0 1.2 0.001
"}
C {capa.sym} 520 -50 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 520 0 3 0 {name=p10 sig_type=std_logic lab=gd}
C {capa.sym} 600 -50 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 600 0 3 0 {name=p11 sig_type=std_logic lab=gd}
C {lab_wire.sym} 480 -140 0 1 {name=p12 sig_type=std_logic lab=nbias}
C {lab_wire.sym} 480 -160 0 1 {name=p13 sig_type=std_logic lab=pbias}
C {lab_wire.sym} 480 -180 0 1 {name=p14 sig_type=std_logic lab=ibias}
