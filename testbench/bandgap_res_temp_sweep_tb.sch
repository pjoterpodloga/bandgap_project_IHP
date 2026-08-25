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
N 500 -190 500 -160 {lab=gd}
N 500 -390 500 -350 {lab=vp}
N 740 -270 740 -250 {lab=v_ref}
N 740 -190 740 -160 {lab=gd}
N 420 -30 420 0 {lab=gd}
N 460 -190 460 -150 {lab=vd8}
N 400 -190 400 -150 {lab=vd1}
N 580 -270 740 -270 {lab=v_ref}
N 580 -230 660 -230 {lab=vbias}
C {vsource.sym} 150 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 150 -210 0 0 {name=VP value=xvp savecurrent=true}
C {vsource.sym} 240 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 240 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 150 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 210 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 150 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {lab_wire.sym} 500 -180 3 0 {name=p6 sig_type=std_logic lab=gd}
C {lab_wire.sym} 610 -270 0 1 {name=p7 sig_type=std_logic lab=v_ref}
C {lab_wire.sym} 500 -360 3 1 {name=p3 sig_type=std_logic lab=vp}
C {netlist.sym} 0 -860 0 0 {name=s1 
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerPNP.lib typ

.param xvp=3.3

.param xtemp=25

.probe isub(x1)
.save v(v_ref)
.save v(vp)
.save v(start_up)
.save v(x1.vg)
.save v(vd1)
.save v(vd8)
.save i(vp)
.save v(vbias)

.options rshunt=1G

.temp 'xtemp'
.dc temp -50 125 0.1
"}
C {lab_wire.sym} 740 -180 3 0 {name=p8 sig_type=std_logic lab=gd}
C {capa-2.sym} 740 -220 0 0 {name=C1
m=1
value=1p
footprint=1206
device=polarized_capacitor}
C {/foss/designs/test/circuit/bandgap_res_diodes.sym} 400 -150 0 0 {name=x2}
C {lab_wire.sym} 420 -20 3 0 {name=p4 sig_type=std_logic lab=gd}
C {lab_wire.sym} 460 -180 3 0 {name=p5 sig_type=std_logic lab=vd8}
C {lab_wire.sym} 400 -180 3 0 {name=p9 sig_type=std_logic lab=vd1}
C {/foss/designs/test/circuit/bandgap_res_core_wrapper.sym} 380 -270 0 0 {name=xdut}
C {lab_wire.sym} 610 -230 0 1 {name=p1 sig_type=std_logic lab=vbias}
C {noconn.sym} 660 -230 2 0 {name=l2}
