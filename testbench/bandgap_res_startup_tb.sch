v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 370 -230 370 -160 {lab=vd1}
N 430 -230 430 -160 {lab=vd8}
N 470 -230 470 -10 {lab=gd}
N 390 -40 390 -10 {lab=gd}
N 470 -430 470 -390 {lab=vp}
N 30 -210 30 -190 {lab=gd}
N 30 -130 30 -110 {lab=0}
N 30 -210 110 -210 {lab=gd}
N 30 -230 30 -210 {lab=gd}
N 110 -210 110 -190 {lab=gd}
N 110 -130 110 -110 {lab=sub!}
N 30 -310 30 -290 {lab=vp}
N 700 -150 700 -10 {lab=gd}
N 620 -150 620 -10 {lab=gd}
N 550 -270 620 -270 {lab=vbias}
N 620 -270 620 -210 {lab=vbias}
N 550 -310 700 -310 {lab=out}
N 700 -310 700 -210 {lab=out}
C {/foss/designs/test/circuit/bandgap_res_core_wrapper.sym} 350 -310 0 0 {name=xdut}
C {/foss/designs/test/circuit/bandgap_res_diodes.sym} 370 -160 0 0 {name=x2}
C {lab_wire.sym} 370 -220 3 0 {name=p1 sig_type=std_logic lab=vd1}
C {lab_wire.sym} 430 -220 3 0 {name=p2 sig_type=std_logic lab=vd8}
C {lab_wire.sym} 470 -430 3 0 {name=p3 sig_type=std_logic lab=vp}
C {netlist.sym} 0 -970 0 0 {name=s1 
value=
"
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerPNP.lib typ

.include cap_mfringe.lib

.param xvp=3.3
.param xtemp=25
.param xdelay=200n

.save v(out)
.save v(vd1)
.save v(vd8)
.save v(vp)
.save v(vbias)

.save v(xdut.xstartup.vcap)
.save v(xdut.xbandgap.vg)
.save v(xdut.xbias.vr)
.save v(xdut.vcap)

.probe isub(x2.d1)
.probe isub(x2.d8)

.save v(xdut.bandgap_res_startup_0.vcap)
.save v(xdut.const_gm_bias_0.vr)
.save v(xdut.const_gm_bias_0.startup)

.temp 'xtemp'

.options rshunt=1G

.tran 1n 10.2u uic
"}
C {vsource.sym} 30 -160 0 0 {name=VGD value=0 savecurrent=false}
C {lab_wire.sym} 30 -110 3 1 {name=p4 sig_type=std_logic lab=0}
C {vsource.sym} 110 -160 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 110 -110 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 90 -210 0 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 30 -310 3 0 {name=p6 sig_type=std_logic lab=vp}
C {vsource.sym} 30 -260 0 0 {name=VP
value="PWL(0 0 'xdelay' 0 'xdelay+1n' 'xvp')" 
savecurrent=false}
C {lab_wire.sym} 390 -10 3 1 {name=p7 sig_type=std_logic lab=gd}
C {lab_wire.sym} 470 -10 3 1 {name=p8 sig_type=std_logic lab=gd}
C {capa.sym} 700 -180 0 0 {name=C1
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 700 -10 3 1 {name=p10 sig_type=std_logic lab=gd}
C {capa.sym} 620 -180 0 0 {name=C2
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 620 -10 3 1 {name=p11 sig_type=std_logic lab=gd}
C {lab_wire.sym} 610 -270 0 0 {name=p9 sig_type=std_logic lab=vbias}
C {lab_wire.sym} 610 -310 0 0 {name=p12 sig_type=std_logic lab=out}
