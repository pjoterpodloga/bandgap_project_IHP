v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1220 -210 1220 -180 {lab=gd}
N 1200 -210 1200 -180 {lab=bias}
N 1220 -380 1220 -350 {lab=#net1}
N 1060 -250 1060 -200 {lab=inm}
N 940 -310 940 -200 {lab=inp}
N 1060 -140 1060 -100 {lab=#net2}
N 940 -140 940 -100 {lab=#net2}
N 1060 -250 1140 -250 {lab=inm}
N 1100 -190 1120 -190 {lab=in}
N 1100 -150 1120 -150 {lab=gd}
N 880 -190 900 -190 {lab=in}
N 880 -150 900 -150 {lab=gd}
N 1390 -280 1390 -200 {lab=out}
N 1390 -140 1390 -100 {lab=gd}
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
N 1000 -100 1060 -100 {lab=#net2}
N 1000 -100 1000 -80 {lab=#net2}
N 940 -100 1000 -100 {lab=#net2}
N 1000 -20 1000 0 {lab=gd}
N 1320 -280 1390 -280 {lab=out}
N 520 -380 520 -330 {lab=vp}
N 520 -110 520 0 {lab=gd}
N 650 -260 770 -260 {lab=#net3}
N 940 -310 1140 -310 {lab=inp}
N 650 -280 680 -280 {lab=#net4}
N 650 -240 680 -240 {lab=#net5}
N 1220 -470 1220 -440 {lab=vp}
N 770 -140 770 -120 {lab=bias}
N 770 -60 770 -0 {lab=gd}
N 770 -90 840 -90 {lab=gd}
N 700 -90 730 -90 {lab=bias}
N 700 -140 700 -90 {lab=bias}
N 700 -140 770 -140 {lab=bias}
N 770 -260 770 -230 {lab=#net3}
N 770 -170 770 -140 {lab=bias}
C {lab_wire.sym} 1200 -180 3 1 {name=p4 sig_type=std_logic lab=bias}
C {lab_wire.sym} 1220 -180 3 1 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1220 -470 3 0 {name=p6 sig_type=std_logic lab=vp}
C {vcvs.sym} 940 -170 0 0 {name=EINP value=0.5}
C {vcvs.sym} 1060 -170 0 1 {name=EINM value=-0.5}
C {lab_wire.sym} 1120 -310 0 0 {name=p7 sig_type=std_logic lab=inp}
C {lab_wire.sym} 1120 -250 0 0 {name=p8 sig_type=std_logic lab=inm}
C {lab_wire.sym} 890 -150 0 0 {name=p11 sig_type=std_logic lab=gd}
C {lab_wire.sym} 890 -190 0 0 {name=p12 sig_type=std_logic lab=in}
C {lab_wire.sym} 1110 -150 0 1 {name=p13 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1110 -190 0 1 {name=p14 sig_type=std_logic lab=in}
C {capa-2.sym} 1390 -170 0 0 {name=C1
m=1
value=xcload
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 1390 -100 3 1 {name=p15 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1380 -280 0 0 {name=p16 sig_type=std_logic lab=out}
C {vsource.sym} 140 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 140 -210 0 0 {name=VP value=xvp savecurrent=false}
C {vsource.sym} 230 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 230 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 140 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 200 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 140 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {vsource.sym} 320 -210 0 0 {name=VIN value="DC xvid" ac=1 savecurrent=false}
C {lab_wire.sym} 320 -270 3 0 {name=p20 sig_type=std_logic lab=in}
C {vsource.sym} 1000 -50 0 0 {name=VCM value='0.7' savecurrent=false}
C {lab_wire.sym} 1000 -10 3 0 {name=p9 sig_type=std_logic lab=gd}
C {lab_wire.sym} 520 -10 3 0 {name=p1 sig_type=std_logic lab=gd}
C {lab_wire.sym} 520 -370 3 0 {name=p3 sig_type=std_logic lab=vp}
C {/foss/designs/test/circuit/const_gm_bias.sym} 430 -130 0 0 {name=x2}
C {netlist.sym} 10 -720 0 0 {name=s1 
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ

.include cap_mfringe.lib

.param xvp=3.3
.param xvid=0
.param xcload=1p

.param xtemp=25

.save v(in)
.save v(out)
.save i(vibias)
.save v(vp)
.save i(viopamp)

.temp 'xtemp'
.dc VIN -10m 10m 10u

.option rshunt=1e12
"}
C {noconn.sym} 680 -280 2 0 {name=l2}
C {noconn.sym} 680 -240 2 0 {name=l3}
C {vsource.sym} 1220 -410 0 0 {name=Viopamp value=0 savecurrent=true}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 750 -90 0 0 {name=M1
l=0.9u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} 770 -10 3 0 {name=p2 sig_type=std_logic lab=gd}
C {lab_wire.sym} 820 -90 0 1 {name=p10 sig_type=std_logic lab=gd}
C {/foss/designs/test/circuit/opamp_folded_pmos_buf.sym} 1140 -310 0 0 {name=x1}
C {lab_wire.sym} 720 -140 0 1 {name=p21 sig_type=std_logic lab=bias}
C {vsource.sym} 770 -200 0 0 {name=Vibias value=0 savecurrent=true}
