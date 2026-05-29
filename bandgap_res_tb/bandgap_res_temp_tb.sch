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
N 480 -280 480 -230 {lab=vp}
N 590 -170 650 -170 {lab=#net1}
N 650 -200 650 -170 {lab=#net1}
N 650 -280 650 -260 {lab=bias}
N 790 -170 830 -170 {lab=bias}
N 790 -230 790 -170 {lab=bias}
N 480 -110 480 -80 {lab=gd}
N 930 -90 930 -60 {lab=gd}
N 930 -300 930 -250 {lab=vp}
N 1030 -170 1070 -170 {lab=v_ref}
C {/foss/designs/master/bandgap_res/bandgap_res.sym} 830 -170 0 0 {name=x1}
C {vsource.sym} 150 -70 0 0 {name=VGD value=0 savecurrent=false}
C {vsource.sym} 150 -210 0 0 {name=VP value=xvp savecurrent=true}
C {vsource.sym} 240 -70 0 0 {name=VSUB value=0 savecurrent=false}
C {sg13cmos5l_pr/sub.sym} 240 -20 0 0 {name=l1 lab=sub!}
C {lab_wire.sym} 150 -20 3 0 {name=p17 sig_type=std_logic lab=0}
C {lab_wire.sym} 210 -140 0 0 {name=p18 sig_type=std_logic lab=gd}
C {lab_wire.sym} 150 -270 3 0 {name=p19 sig_type=std_logic lab=vp}
C {simulator_commands_shown.sym} 10 -1140 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerPNP.lib typ

.param xvp=3.3

.param xtemp=25

.probe alli
.probe v(x1)
.probe isub(x1)
.save all

.temp 25
.dc temp -50 125 0.1




.control
let vp_start = 2.97
let vp_stop = 3.6
let vp_delta = 0.01
let vp_act = vp_start

run
save all
set filetype=ascii
write bandgap_res_temp_tb.raw all

shell 'rm -rf vp-sweep.out'
shell 'echo Sweep:vp-sweep >> vp-sweep.out'

while vp_act < vp_stop
	alter vp $&vp_act
	run
	set appendwrite
	shell 'echo Sweep value:$&vp_act >> vp-sweep.out'
	write vp-sweep.out v(v_ref) v(vp)
	let vp_act = vp_act + vp_delta
end
.endc
"
      }
C {/foss/designs/master/bandgap_res/const_gm_bias.sym} 390 -170 0 0 {name=x2}
C {lab_wire.sym} 480 -90 3 1 {name=p1 sig_type=std_logic lab=gd}
C {vsource.sym} 650 -230 0 0 {name=Vibias value=0 savecurrent=true}
C {lab_wire.sym} 650 -280 3 0 {name=p2 sig_type=std_logic lab=bias}
C {lab_wire.sym} 480 -270 3 0 {name=p3 sig_type=std_logic lab=vp}
C {lab_wire.sym} 790 -210 3 0 {name=p4 sig_type=std_logic lab=bias}
C {lab_wire.sym} 930 -290 3 0 {name=p5 sig_type=std_logic lab=vp}
C {lab_wire.sym} 930 -70 3 1 {name=p6 sig_type=std_logic lab=gd}
C {lab_wire.sym} 1040 -170 0 1 {name=p7 sig_type=std_logic lab=v_ref}
