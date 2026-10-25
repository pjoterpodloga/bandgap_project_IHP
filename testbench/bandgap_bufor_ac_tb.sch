v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1180 -200 1180 -170 {lab=gd}
N 1160 -200 1160 -170 {lab=bias}
N 1180 -370 1180 -340 {lab=#net1}
N 1020 -240 1020 -190 {lab=inm}
N 900 -300 900 -190 {lab=#net2}
N 1020 -130 1020 -90 {lab=#net3}
N 900 -130 900 -90 {lab=#net3}
N 1020 -240 1100 -240 {lab=inm}
N 1060 -180 1080 -180 {lab=in}
N 1060 -140 1080 -140 {lab=gd}
N 840 -180 860 -180 {lab=in}
N 840 -140 860 -140 {lab=gd}
N 1350 -270 1350 -190 {lab=out}
N 1350 -130 1350 -90 {lab=gd}
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
N 960 -90 1020 -90 {lab=#net3}
N 960 -90 960 -70 {lab=#net3}
N 900 -90 960 -90 {lab=#net3}
N 960 -10 960 10 {lab=gd}
N 1280 -270 1350 -270 {lab=out}
N 520 -380 520 -330 {lab=vp}
N 520 -110 520 0 {lab=gd}
N 650 -260 740 -260 {lab=#net4}
N 650 -280 680 -280 {lab=#net5}
N 650 -240 680 -240 {lab=#net6}
N 1180 -460 1180 -430 {lab=vp}
N 1010 -300 1100 -300 {lab=inp}
N 900 -300 950 -300 {lab=#net2}
N 740 -260 740 -240 {lab=#net4}
N 740 -180 740 -140 {lab=bias}
N 740 -40 740 -0 {lab=gd}
N 660 -70 700 -70 {lab=bias}
N 660 -140 660 -70 {lab=bias}
N 660 -140 740 -140 {lab=bias}
N 740 -140 740 -100 {lab=bias}
N 740 -70 820 -70 {lab=gd}
C {lab_wire.sym} 1160 -170 3 1 {name=p4 sig_type=std_logic lab=bias}
C {lab_wire.sym} 1180 -170 3 1 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1180 -460 3 0 {name=p6 sig_type=std_logic lab=vp}
C {vcvs.sym} 900 -160 0 0 {name=EINP value=0.5}
C {vcvs.sym} 1020 -160 0 1 {name=EINM value=-0.5}
C {lab_wire.sym} 1080 -300 0 0 {name=p7 sig_type=std_logic lab=inp}
C {lab_wire.sym} 1080 -240 0 0 {name=p8 sig_type=std_logic lab=inm}
C {lab_wire.sym} 850 -140 0 0 {name=p11 sig_type=std_logic lab=gd}
C {lab_wire.sym} 850 -180 0 0 {name=p12 sig_type=std_logic lab=in}
C {lab_wire.sym} 1070 -140 0 1 {name=p13 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1070 -180 0 1 {name=p14 sig_type=std_logic lab=in}
C {capa-2.sym} 1350 -160 0 0 {name=C1
m=1
value=xcload
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 1350 -90 3 1 {name=p15 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1340 -270 0 0 {name=p16 sig_type=std_logic lab=out}
C {vsource.sym} 140 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 140 -210 0 0 {name=VP value=xvp savecurrent=false}
C {vsource.sym} 230 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 230 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 140 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 200 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 140 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {vsource.sym} 320 -210 0 0 {name=VIN value="DC=xvid AC=1" ac=1 savecurrent=false}
C {lab_wire.sym} 320 -270 3 0 {name=p20 sig_type=std_logic lab=in}
C {vsource.sym} 960 -40 0 0 {name=VCM value='0.7' savecurrent=false}
C {lab_wire.sym} 960 0 3 0 {name=p9 sig_type=std_logic lab=gd}
C {lab_wire.sym} 520 -10 3 0 {name=p1 sig_type=std_logic lab=gd}
C {vsource.sym} 740 -210 0 0 {name=Vibias value=0 savecurrent=true}
C {lab_wire.sym} 520 -370 3 0 {name=p3 sig_type=std_logic lab=vp}
C {/foss/designs/test/circuit/const_gm_bias.sym} 430 -130 0 0 {name=x2}
C {netlist.sym} 10 -740 0 0 {name=s1 
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ

.include cap_mfringe.lib

.param xvp=3.3
.param xvid=0
.param xcload=1p

.param vioff='from_variant'
.param xvioff='vioff'

.param xtemp=25

.save v(in)
.save v(out)
.save v(vp)

.temp 'xtemp'
.ac DEC 101 1 1G

.option rshunt=1e12
"}
C {noconn.sym} 680 -280 2 0 {name=l2}
C {noconn.sym} 680 -240 2 0 {name=l3}
C {vsource.sym} 1180 -400 0 0 {name=Viopamp value=0 savecurrent=true}
C {vsource.sym} 980 -300 1 0 {name=VIN1 value="DC='vioff' AC=0" ac=1 savecurrent=false}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 720 -70 0 0 {name=M1
l=0.9u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} 740 -10 3 0 {name=p2 sig_type=std_logic lab=gd}
C {lab_wire.sym} 800 -70 0 1 {name=p10 sig_type=std_logic lab=gd}
C {lab_wire.sym} 680 -140 0 1 {name=p21 sig_type=std_logic lab=bias}
C {/foss/designs/test/circuit/opamp_folded_pmos_buf.sym} 1100 -300 0 0 {name=x1}
