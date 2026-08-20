v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -150 40 -130 {lab=gd}
N 40 -70 40 -40 {lab=0}
N 40 -150 140 -150 {lab=gd}
N 40 -170 40 -150 {lab=gd}
N 140 -70 140 -40 {lab=sub!}
N 140 -150 140 -130 {lab=gd}
N 40 -260 40 -230 {lab=vp}
N 410 -70 410 -40 {lab=gd}
N 410 -320 410 -290 {lab=vp}
N 540 -180 600 -180 {lab=ibias}
N 600 -180 600 -160 {lab=ibias}
N 600 -100 600 -40 {lab=gd}
C {vsource.sym} 40 -200 0 0 {name=VP savecurrent=false
value="DC='xvp' PWL(0 0 'xdelay' 0 'xdelay+1n' 'xvp')"}
C {vsource.sym} 40 -100 0 0 {name=VGD value=0 savecurrent=false}
C {lab_wire.sym} 40 -40 3 0 {name=p1 sig_type=std_logic lab=0}
C {lab_wire.sym} 100 -150 0 0 {name=p2 sig_type=std_logic lab=gd}
C {vsource.sym} 140 -100 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 140 -40 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 40 -260 3 1 {name=p3 sig_type=std_logic lab=vp}
C {netlist.sym} 10 -900 0 0 {name=s1
value=
"
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ

.include cap_mfringe.lib

.param xvp=3.3
.param xtemp=25
.param xdelay=200n

.save v(ibias)
.save i(vibias)
.save v(nbias)

.save v(xdut.xgm_core.nbias)
.save v(xdut.xgm_core.pbias)
.save v(xdut.xgm_core.stup)

.save v(xdut.const_gm_bias_core_0.pbias)
.save v(xdut.const_gm_bias_core_0.nbias)
.save v(xdut.const_gm_bias_core_0.stup)

.save v(xdut.pbias)
.save v(xdut.nbias)
.save v(xdut.stup)

.temp 'xtemp'

.options rshunt=1G

.tran 500p 2.2u
"
}
C {/foss/designs/test/circuit/const_gm_bias.sym} 320 -90 0 0 {name=xdut}
C {vsource.sym} 600 -130 0 0 {name=VIBIAS value=0 savecurrent=false}
C {lab_wire.sym} 410 -40 3 0 {name=p4 sig_type=std_logic lab=gd}
C {lab_wire.sym} 600 -40 3 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 410 -320 3 1 {name=p6 sig_type=std_logic lab=vp}
C {lab_wire.sym} 590 -180 0 0 {name=p7 sig_type=std_logic lab=ibias}
