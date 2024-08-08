v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 875 -1670 875 -1650 {
lab=GND}
N 835 -1700 855 -1700 {
lab=GND}
N 835 -1700 835 -1650 {
lab=GND}
N 1025 -1650 1025 -1630 {
lab=GND}
N 835 -1750 875 -1750 {
lab=GND}
N 835 -1750 835 -1700 {
lab=GND}
N 875 -1750 875 -1730 {
lab=GND}
N 1025 -1800 1025 -1730 {
lab=vss}
N 1580 -2030 1580 -1965 {
lab=#net1}
N 1580 -1905 1580 -1880 {
lab=GND}
N 1560 -2030 1580 -2030 {
lab=#net1}
N 1580 -1880 1580 -1680 {
lab=GND}
N 970 -1650 1580 -1650 {
lab=GND}
N 1580 -1680 1580 -1650 {
lab=GND}
N 1240 -1690 1260 -1690 {
lab=GND}
N 880 -1650 970 -1650 {
lab=GND}
N 870 -1650 880 -1650 {
lab=GND}
N 840 -1650 870 -1650 {
lab=GND}
N 835 -1650 840 -1650 {
lab=GND}
N 1025 -2030 1260 -2030 {
lab=vss}
N 1025 -2030 1025 -1800 {
lab=vss}
N 1025 -1670 1025 -1650 {
lab=GND}
N 1240 -1710 1260 -1710 {
lab=GND}
N 1240 -1730 1260 -1730 {
lab=vss}
N 1240 -2010 1260 -2010 {
lab=vss}
N 1240 -1990 1260 -1990 {
lab=vss}
N 1240 -1970 1260 -1970 {
lab=vss}
N 1240 -1950 1260 -1950 {
lab=vss}
N 1240 -1930 1260 -1930 {
lab=vss}
N 1240 -1910 1260 -1910 {
lab=vss}
N 1240 -1890 1260 -1890 {
lab=vss}
N 1240 -1870 1260 -1870 {
lab=vss}
N 1240 -1850 1260 -1850 {
lab=vss}
N 1240 -1830 1260 -1830 {
lab=vss}
N 1240 -1810 1260 -1810 {
lab=vss}
N 1240 -1790 1260 -1790 {
lab=vss}
N 1240 -1770 1260 -1770 {
lab=vss}
N 1240 -1750 1260 -1750 {
lab=vss}
N 1240 -1690 1240 -1650 {
lab=GND}
N 1240 -1710 1240 -1690 {
lab=GND}
N 1240 -2010 1240 -1990 {
lab=vss}
N 1240 -1990 1240 -1970 {
lab=vss}
N 1240 -1970 1240 -1950 {
lab=vss}
N 1240 -1950 1240 -1930 {
lab=vss}
N 1240 -1930 1240 -1910 {
lab=vss}
N 1240 -1910 1240 -1890 {
lab=vss}
N 1240 -1890 1240 -1870 {
lab=vss}
N 1240 -1870 1240 -1850 {
lab=vss}
N 1240 -1850 1240 -1830 {
lab=vss}
N 1240 -1830 1240 -1810 {
lab=vss}
N 1240 -1810 1240 -1805 {
lab=vss}
N 1240 -1805 1240 -1790 {
lab=vss}
N 1240 -1790 1240 -1770 {
lab=vss}
N 1240 -1770 1240 -1750 {
lab=vss}
N 1240 -1750 1240 -1730 {
lab=vss}
N 1240 -2030 1240 -2010 {
lab=vss}
C {/foss/designs/tt08-analog-bias-generator/xschem/tt08_analog_bias_generator.sym} 1410 -1860 0 0 {name=x1}
C {sky130_fd_pr/corner.sym} 830 -1885 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code.sym} 830 -2030 0 0 {name=spice
only_toplevel=false
value="
.control
.option savecurrents
*.options temp=-40
dc V1 1.65 1.95 0.05 temp -40 125 15
plot i(Vmeas) title vs_Supply_tt_-40degto125deg
*plot v(ptat)
*plot v(drive)
dc temp -40 125 5
plot i(Vmeas) title vs_Temp_tt
*plot v(x1.drive) v(x1.ncascode)/2.0 title vs_Temp_tt
*plot v(x1.ptat) title vs_Temp_tt
set temp=-40
tran 2n 4u
*plot v(VSS) title Start_Up_tt_-40deg
plot i(Vmeas) title Start_Up_tt_-40deg
set temp=125
tran 2n 4u
*plot V(VSS) title Start_Up_tt_125deg
plot i(Vmeas) title Start_Up_tt_125deg
save all
set temp=27
op
*print all
write tb_tt08_analog_bias_generator.raw
.endc
.save all
"}
C {devices/vsource.sym} 1025 -1700 0 0 {name=V1 value="pulse 1.8 0.0 0 10n 10n 2u 4u" savecurrent=false}
C {devices/gnd.sym} 1025 -1630 0 0 {name=l1 lab=GND}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 875 -1700 0 0 {name=R1
L=70.0
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 1025 -2030 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/ammeter.sym} 1580 -1935 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
