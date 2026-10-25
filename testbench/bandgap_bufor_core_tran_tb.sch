v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 30 -210 30 -190 {lab=gd}
N 30 -130 30 -110 {lab=0}
N 30 -210 110 -210 {lab=gd}
N 30 -230 30 -210 {lab=gd}
N 110 -210 110 -190 {lab=gd}
N 110 -130 110 -110 {lab=sub!}
N 30 -310 30 -290 {lab=vp_18}
N 740 -350 820 -350 {lab=vref_res}
N 720 -90 820 -90 {lab=vref_sb}
N 820 -180 820 -90 {lab=vref_sb}
N 660 -270 660 -250 {lab=gd}
N 660 -190 660 -170 {lab=vp_18}
N 660 -10 660 10 {lab=gd}
N 740 -310 1040 -310 {lab=bias}
N 1090 -270 1090 -250 {lab=vp_33}
N 1090 -90 1090 -70 {lab=gd}
N 660 -450 660 -430 {lab=vp_33}
N 820 -350 820 -320 {lab=vref_res}
N 820 -320 830 -320 {lab=vref_res}
N 830 -320 830 -300 {lab=vref_res}
N 820 -300 830 -300 {lab=vref_res}
N 820 -300 820 -200 {lab=vref_res}
N 1130 -150 1190 -150 {lab=out}
N 1040 -310 1040 -250 {lab=bias}
N 870 -160 910 -160 {lab=sel}
N 870 -140 910 -140 {lab=sel_n}
N 820 -180 910 -180 {lab=vref_sb}
N 820 -200 910 -200 {lab=vref_res}
N 1190 -150 1190 -110 {lab=out}
N 1190 -50 1190 -30 {lab=gd}
N 180 -310 180 -290 {lab=vp_33}
N 110 -210 180 -210 {lab=gd}
N 180 -230 180 -210 {lab=gd}
N 280 -310 280 -290 {lab=sel}
N 280 -230 280 -210 {lab=gd}
N 180 -210 280 -210 {lab=gd}
N 280 -310 340 -310 {lab=sel}
N 280 -350 340 -350 {lab=vp_33}
N 380 -300 380 -280 {lab=gd}
N 380 -380 380 -360 {lab=sel_n}
N 1280 -50 1280 -30 {lab=gd}
N 1190 -150 1280 -150 {lab=out}
N 1280 -150 1280 -110 {lab=out}
C {netlist.sym} 0 -840 0 0 {name=s1 
value=
"
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerPNP.lib typ

.include cap_mfringe.lib

.param xvp_33=3.3
.param xvp_18=1.8
.param xtemp=25

.save v(vp_18)
.save v(vp_33)
.save v(vref_res)
.save v(vref_sb)
.save v(bias)
.save v(sel)
.save v(out)
.save v(x1.vg)
.save v(x1.vbuf)

.temp 'xtemp'

.options rshunt=1G

.tran 10n 100u
"}
C {vsource.sym} 30 -160 0 0 {name=VGD value=0 savecurrent=false}
C {lab_wire.sym} 30 -110 3 1 {name=p4 sig_type=std_logic lab=0}
C {vsource.sym} 110 -160 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 110 -110 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 90 -210 0 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 30 -300 3 1 {name=p6 sig_type=std_logic lab=vp_18}
C {vsource.sym} 30 -260 0 0 {name=VP18
value='xvp_18'
savecurrent=false}
C {capa.sym} 1190 -80 0 0 {name=C1
m=1
value=30n
footprint=1206
device="ceramic capacitor"}
C {/foss/designs/test/circuit/bandgap_buf_core.sym} 910 -200 0 0 {name=x1}
C {/foss/designs/test/circuit/bandgap_res_top.sym} 540 -350 0 0 {name=x3}
C {/foss/designs/test/circuit/bandgap_selfbias_top.sym} 520 -90 0 0 {name=x4}
C {lab_wire.sym} 1160 -150 0 1 {name=p13 sig_type=std_logic lab=out}
C {lab_wire.sym} 1090 -260 3 1 {name=p14 sig_type=std_logic lab=vp_33}
C {lab_wire.sym} 1090 -80 3 0 {name=p15 sig_type=std_logic lab=gd}
C {lab_wire.sym} 660 0 3 0 {name=p16 sig_type=std_logic lab=gd}
C {lab_wire.sym} 660 -180 3 1 {name=p17 sig_type=std_logic lab=vp_18}
C {lab_wire.sym} 660 -260 3 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 660 -440 3 1 {name=p19 sig_type=std_logic lab=vp_33}
C {lab_wire.sym} 810 -350 0 0 {name=p20 sig_type=std_logic lab=vref_res}
C {lab_wire.sym} 810 -90 0 0 {name=p21 sig_type=std_logic lab=vref_sb}
C {lab_wire.sym} 810 -310 0 0 {name=p22 sig_type=std_logic lab=bias}
C {lab_wire.sym} 900 -160 0 0 {name=p23 sig_type=std_logic lab=sel}
C {lab_wire.sym} 900 -140 0 0 {name=p24 sig_type=std_logic lab=sel_n}
C {lab_wire.sym} 1190 -40 3 0 {name=p25 sig_type=std_logic lab=gd}
C {lab_wire.sym} 180 -300 3 1 {name=p1 sig_type=std_logic lab=vp_33}
C {vsource.sym} 180 -260 0 0 {name=VP33
value='xvp_33'
savecurrent=false}
C {lab_wire.sym} 280 -300 3 1 {name=p2 sig_type=std_logic lab=sel}
C {vsource.sym} 280 -260 0 0 {name=VSEL
value="PWL(0 0 '20u' 0 '20u+1n' 'xvp_33' '60u' 'xvp_33' '60u+1n' '0')" 
savecurrent=false}
C {vcvs.sym} 380 -330 0 0 {name=ESEL_N value=1}
C {lab_wire.sym} 330 -350 0 0 {name=p3 sig_type=std_logic lab=vp_33}
C {lab_wire.sym} 380 -290 3 0 {name=p7 sig_type=std_logic lab=gd}
C {lab_wire.sym} 380 -370 3 1 {name=p8 sig_type=std_logic lab=sel_n}
C {res.sym} 1280 -80 0 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 1280 -40 3 0 {name=p9 sig_type=std_logic lab=gd}
