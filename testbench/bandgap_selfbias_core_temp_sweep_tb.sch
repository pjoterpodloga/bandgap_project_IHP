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
N 480 -190 480 -160 {lab=gd}
N 480 -390 480 -350 {lab=vp}
N 540 -270 580 -270 {lab=v_ref}
N 580 -270 580 -250 {lab=v_ref}
N 580 -190 580 -160 {lab=gd}
N 380 -190 380 -100 {lab=vd}
N 380 -40 380 -0 {lab=gd}
N 320 -70 340 -70 {lab=gd}
N 320 -70 320 -0 {lab=gd}
N 320 -0 380 -0 {lab=gd}
C {vsource.sym} 150 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 150 -210 0 0 {name=VP value=xvp savecurrent=true}
C {vsource.sym} 240 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 240 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 150 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 210 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 150 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {lab_wire.sym} 480 -180 3 0 {name=p6 sig_type=std_logic lab=gd}
C {lab_wire.sym} 550 -270 0 1 {name=p7 sig_type=std_logic lab=v_ref}
C {lab_wire.sym} 480 -360 3 1 {name=p3 sig_type=std_logic lab=vp}
C {netlist.sym} 10 -730 0 0 {name=s1 
value="
.lib cornerMOShv.lib mos_tt
.lib cornerPNP.lib typ

.param xvp=1.2

.param xtemp=25

.probe isub(x1)
.save v(v_ref)
.save v(vp)
.save v(vd)
.save v(start_up)
.save i(vp)
.save i(vibias)
*.save all

*.options rshunt=1G

.temp 'xtemp'
.dc temp -50 125 0.1
"}
C {lab_wire.sym} 580 -180 3 0 {name=p8 sig_type=std_logic lab=gd}
C {capa-2.sym} 580 -220 0 0 {name=C1
m=1
value=1p
footprint=1206
device=polarized_capacitor}
C {/foss/designs/test/circuit/bandgap_selfbias_core.sym} 340 -270 0 0 {name=x1}
C {lab_wire.sym} 380 -160 3 0 {name=p1 sig_type=std_logic lab=vd}
C {lab_wire.sym} 380 -30 3 0 {name=p2 sig_type=std_logic lab=gd}
C {sg13cmos5l_pr/pnpMPA.sym} 360 -70 0 0 {name=Q1
model=pnpMPA
spiceprefix=X
w=1.0e-6
l=1.0e-6
m=1
}
