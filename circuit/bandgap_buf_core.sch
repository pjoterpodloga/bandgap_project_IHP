v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 400 -210 400 -170 {lab=vbias}
N 360 -170 400 -170 {lab=vbias}
N 420 -210 420 -140 {lab=gd}
N 420 -140 430 -140 {lab=gd}
N 430 -140 430 -120 {lab=gd}
N 420 -120 430 -120 {lab=gd}
N 0 -20 420 -20 {lab=gd}
N 0 -490 420 -490 {lab=vp}
N 0 -410 40 -410 {lab=vref_res}
N 110 -470 110 -450 {lab=vp}
N 80 -470 80 -450 {lab=sel}
N 80 -370 80 -350 {lab=sel_n}
N 110 -370 110 -350 {lab=gd}
N 120 -410 180 -410 {lab=vbuf}
N 120 -210 180 -210 {lab=vbuf}
N 110 -270 110 -250 {lab=vp}
N 80 -270 80 -250 {lab=sel_n}
N 80 -170 80 -150 {lab=sel}
N 110 -170 110 -150 {lab=gd}
N 420 -490 420 -350 {lab=vp}
N 180 -310 180 -210 {lab=vbuf}
N 0 -210 40 -210 {lab=vref_sb}
N 560 -280 580 -280 {lab=vg}
N 620 -250 620 -130 {lab=vout}
N 620 -490 620 -310 {lab=vp}
N 560 -490 620 -490 {lab=vp}
N 0 -330 20 -330 {lab=sel}
N 0 -290 20 -290 {lab=sel_n}
N 420 -120 420 -20 {lab=gd}
N 620 -130 760 -130 {lab=vout}
N 560 -130 620 -130 {lab=vout}
N 620 -280 690 -280 {lab=gd}
N 180 -310 340 -310 {lab=vbuf}
N 180 -410 180 -310 {lab=vbuf}
N 280 -250 340 -250 {lab=vout}
N 280 -250 280 -130 {lab=vout}
N 560 -40 560 -20 {lab=gd}
N 420 -20 560 -20 {lab=gd}
N 560 -130 560 -100 {lab=vout}
N 280 -130 560 -130 {lab=vout}
N 560 -490 560 -400 {lab=vp}
N 420 -490 560 -490 {lab=vp}
N 560 -340 560 -280 {lab=vg}
N 520 -280 560 -280 {lab=vg}
C {/foss/designs/test/circuit/opamp_folded_pmos_buf.sym} 340 -310 0 0 {name=x1}
C {ipin.sym} 360 -170 0 0 {name=p1 lab=vbias}
C {ipin.sym} 0 -20 0 0 {name=p2 lab=gd}
C {ipin.sym} 0 -490 0 0 {name=p3 lab=vp}
C {/foss/designs/test/circuit/bandgap_bufor_tg.sym} 40 -410 0 0 {name=x2}
C {lab_wire.sym} 110 -360 3 0 {name=p5 sig_type=std_logic lab=gd}
C {lab_wire.sym} 110 -460 3 1 {name=p6 sig_type=std_logic lab=vp}
C {ipin.sym} 0 -410 0 0 {name=p8 lab=vref_res}
C {/foss/designs/test/circuit/bandgap_bufor_tg.sym} 40 -210 0 0 {name=x3}
C {lab_wire.sym} 110 -160 3 0 {name=p10 sig_type=std_logic lab=gd}
C {lab_wire.sym} 110 -260 3 1 {name=p11 sig_type=std_logic lab=vp}
C {lab_wire.sym} 80 -160 3 0 {name=p4 sig_type=std_logic lab=sel}
C {lab_wire.sym} 80 -360 3 0 {name=p7 sig_type=std_logic lab=sel_n}
C {lab_wire.sym} 80 -460 3 1 {name=p9 sig_type=std_logic lab=sel}
C {lab_wire.sym} 80 -260 3 1 {name=p12 sig_type=std_logic lab=sel_n}
C {ipin.sym} 0 -210 0 0 {name=p13 lab=vref_sb}
C {opin.sym} 760 -130 0 0 {name=p15 lab=vout}
C {lab_wire.sym} 230 -310 0 1 {name=p16 sig_type=std_logic lab=vbuf}
C {ipin.sym} 0 -330 0 0 {name=p17 lab=sel}
C {ipin.sym} 0 -290 0 0 {name=p18 lab=sel_n}
C {sg13cmos5l_pr/sg13_hv_nmos.sym} 600 -280 0 0 {name=M1
l=0.45u
w=2.4u
ng=1
m=8
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} 680 -280 0 1 {name=p14 sig_type=std_logic lab=gd}
C {lab_wire.sym} 540 -280 0 0 {name=p19 sig_type=std_logic lab=vg}
C {sg13cmos5l_pr/rppd.sym} 560 -70 0 0 {name=RBLEED
w=0.5e-6
l=12e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
value="expr_eng(  ( 70.0e-6 / @w + 260.0 * ( (@b + 1)* @l + ( 1.081*( @w + 6.0e-9 ) + 0.18e-6 )*@b ) / ( @w + 6.0e-9 ) ) / @m  )"
}
C {sg13cmos5l_pr/cap_mfringe.sym} 560 -370 0 0 {name=C1
model=cap_mfringe
w=7.96u
l=18.0u
mmin=1
mmax=2
spiceprefix=X
}
