v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 150 -40 150 0 {lab=0}
N 150 -140 150 -80 {lab=gd}
N 240 -40 240 -20 {lab=sub!}
N 240 -140 240 -100 {lab=gd}
N 150 -180 150 -140 {lab=gd}
N 150 -280 150 -240 {lab=vp}
N 150 -140 240 -140 {lab=gd}
N 660 -190 660 -160 {lab=gd}
N 660 -390 660 -350 {lab=vp}
N 720 -270 760 -270 {lab=v_ref}
N 440 -300 440 -270 {lab=bias}
N 440 -270 520 -270 {lab=bias}
N 440 -390 440 -360 {lab=#net1}
N 440 -480 440 -450 {lab=vp}
N 760 -270 760 -250 {lab=v_ref}
N 760 -190 760 -160 {lab=gd}
N 580 -30 580 0 {lab=gd}
N 620 -190 620 -150 {lab=vd8}
N 560 -190 560 -150 {lab=vd1}
C {vsource.sym} 150 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 150 -210 0 0 {name=VP value=xvp savecurrent=true}
C {vsource.sym} 240 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 240 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 150 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 210 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 150 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {vsource.sym} 440 -330 0 0 {name=Vibias value=0 savecurrent=true}
C {lab_wire.sym} 660 -180 3 0 {name=p6 sig_type=std_logic lab=gd}
C {lab_wire.sym} 730 -270 0 1 {name=p7 sig_type=std_logic lab=v_ref}
C {lab_wire.sym} 510 -270 0 0 {name=p2 sig_type=std_logic lab=bias}
C {isource.sym} 440 -420 0 0 {name=I0 value='xibias'}
C {lab_wire.sym} 440 -460 3 1 {name=p1 sig_type=std_logic lab=vp}
C {lab_wire.sym} 660 -360 3 1 {name=p3 sig_type=std_logic lab=vp}
C {netlist.sym} 0 -860 0 0 {name=s1 
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerPNP.lib typ

.param i_bias_p25 = 'variant'

.param xvp=3.3
.param xibias='i_bias_p25'

.param xtemp=25

*.probe alli
*.probe v(x1)
.probe isub(x1)
.save v(v_ref)
.save v(vp)
.save v(start_up)
.save v(x1.vg)
.save v(vd1)
.save v(vd8)
.save i(vp)
.save i(vibias)
*.save all

.options rshunt=1G

.temp 'xtemp'
.dc temp -50 125 0.1
"}
C {lab_wire.sym} 760 -180 3 0 {name=p8 sig_type=std_logic lab=gd}
C {capa-2.sym} 760 -220 0 0 {name=C1
m=1
value=1p
footprint=1206
device=polarized_capacitor}
C {/foss/designs/test/circuit/bandgap_res_core.sym} 520 -270 0 0 {name=x1}
C {/foss/designs/test/circuit/bandgap_res_diodes.sym} 560 -150 0 0 {name=x2}
C {lab_wire.sym} 580 -20 3 0 {name=p4 sig_type=std_logic lab=gd}
C {lab_wire.sym} 620 -180 3 0 {name=p5 sig_type=std_logic lab=vd8}
C {lab_wire.sym} 560 -180 3 0 {name=p9 sig_type=std_logic lab=vd1}
