v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1080 -210 1080 -180 {lab=gd}
N 1060 -210 1060 -180 {lab=bias}
N 1080 -380 1080 -350 {lab=vp}
N 920 -250 920 -200 {lab=inm}
N 800 -310 800 -200 {lab=inp}
N 920 -140 920 -100 {lab=#net1}
N 800 -140 800 -100 {lab=#net1}
N 920 -250 1000 -250 {lab=inm}
N 960 -190 980 -190 {lab=in}
N 960 -150 980 -150 {lab=gd}
N 740 -190 760 -190 {lab=in}
N 740 -150 760 -150 {lab=gd}
N 1250 -280 1250 -200 {lab=out}
N 1250 -140 1250 -100 {lab=gd}
N 140 -40 140 -0 {lab=0}
N 140 -140 140 -80 {lab=gd}
N 230 -40 230 -20 {lab=sub!}
N 230 -140 230 -100 {lab=gd}
N 140 -180 140 -140 {lab=gd}
N 140 -280 140 -240 {lab=vp}
N 140 -140 230 -140 {lab=gd}
N 320 -280 320 -240 {lab=in}
N 230 -140 320 -140 {lab=gd}
N 320 -180 320 -140 {lab=gd}
N 860 -100 920 -100 {lab=#net1}
N 860 -100 860 -80 {lab=#net1}
N 800 -100 860 -100 {lab=#net1}
N 860 -20 860 0 {lab=gd}
N 1180 -280 1250 -280 {lab=out}
N 520 -380 520 -330 {lab=vp}
N 520 -110 520 0 {lab=gd}
N 650 -260 740 -260 {lab=#net2}
N 740 -290 740 -260 {lab=#net2}
N 740 -370 740 -350 {lab=bias}
N 800 -310 1000 -310 {lab=inp}
N 650 -280 680 -280 {lab=#net3}
N 650 -240 680 -240 {lab=#net4}
C {lab_wire.sym} 1060 -180 3 1 {name=p4 sig_type=std_logic lab=bias}
C {lab_wire.sym} 1080 -180 3 1 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1080 -380 3 0 {name=p6 sig_type=std_logic lab=vp}
C {vcvs.sym} 800 -170 0 0 {name=EINP value=0.5}
C {vcvs.sym} 920 -170 0 1 {name=EINM value=-0.5}
C {lab_wire.sym} 980 -310 0 0 {name=p7 sig_type=std_logic lab=inp}
C {lab_wire.sym} 980 -250 0 0 {name=p8 sig_type=std_logic lab=inm}
C {lab_wire.sym} 750 -150 0 0 {name=p11 sig_type=std_logic lab=gd}
C {lab_wire.sym} 750 -190 0 0 {name=p12 sig_type=std_logic lab=in}
C {lab_wire.sym} 970 -150 0 1 {name=p13 sig_type=std_logic lab=gd}
C {lab_wire.sym} 970 -190 0 1 {name=p14 sig_type=std_logic lab=in}
C {capa-2.sym} 1250 -170 0 0 {name=C1
m=1
value=xcload
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 1250 -100 3 1 {name=p15 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1240 -280 0 0 {name=p16 sig_type=std_logic lab=out}
C {vsource.sym} 140 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 140 -210 0 0 {name=VP value=xvp savecurrent=false}
C {vsource.sym} 230 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 230 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 140 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 200 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 140 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {vsource.sym} 320 -210 0 0 {name=VIN value="DC xvid" ac=1 savecurrent=false}
C {lab_wire.sym} 320 -270 3 0 {name=p20 sig_type=std_logic lab=in}
C {vsource.sym} 860 -50 0 0 {name=VCM value='0.7' savecurrent=false}
C {lab_wire.sym} 860 -10 3 0 {name=p9 sig_type=std_logic lab=gd}
C {lab_wire.sym} 520 -10 3 0 {name=p1 sig_type=std_logic lab=gd}
C {vsource.sym} 740 -320 0 0 {name=Vibias value=0 savecurrent=true}
C {lab_wire.sym} 740 -370 3 0 {name=p2 sig_type=std_logic lab=bias}
C {lab_wire.sym} 520 -370 3 0 {name=p3 sig_type=std_logic lab=vp}
C {/foss/designs/test/circuit/const_gm_bias.sym} 430 -130 0 0 {name=x2}
C {netlist.sym} 10 -840 0 0 {name=s1 
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ

.param xvp=3.3
.param xvid=0
.param xcload=1p

.param xtemp=25

.save v(in)
.save v(out)
.save i(vibias)
.save v(vp)

.temp 'xtemp'
.dc VIN -10m 10m 100u

.option rshunt=1e12
"}
C {noconn.sym} 680 -280 2 0 {name=l2}
C {noconn.sym} 680 -240 2 0 {name=l3}
C {/foss/designs/test/circuit/opamp_folded_pmos.sym} 1000 -310 0 0 {name=x1}
