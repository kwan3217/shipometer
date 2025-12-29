include<kwan_primitives.scad>
pcb_thick=0.8*MM;


module usb_c() {
union() {
r=3.0/2*MM;
translate([-4.4*MM+r,0,1.6*MM])
cube([8.8*MM-r*2,7.2*MM,r*2]);
translate([4.4*MM-r,0,1.6*MM+r])
rotate([-90,0,0])
cylinder(h=7.2*MM,r=r,$fn=36);
translate([-4.4*MM+r,0,1.6*MM+r])
rotate([-90,0,0])
cylinder(h=7.2*MM,r=r,$fn=36);
}
}


module zed_f9r() {

module pin(x,y,z0=-9.4*MM,z1=pcb_thick+2*MM) {
  color("#ffff00",1)
  translate([x-0.3*MM,y-0.3*MM,z0])
  cube([0.6*MM,0.6*MM,z1-z0]);
  color("#000000",1)
  translate([x-0.05*INCH,y-0.05*INCH,-3.4*MM+pcb_thick])
  cube([0.1*INCH,0.1*INCH,3.4*MM-pcb_thick]);
}

module pins(x0,y0,n=10,z0=-9.4*MM,z1=pcb_thick+2*MM) {
for(i=[0:n-1])
pin(x=x0,y=y0-i*0.1*INCH,z0=z0,z1=z1);    
}

color("#ff0000",1)
difference() {
cube([1.7*INCH,2.0*INCH,pcb_thick]);
translate([0.1*INCH,0.1*INCH,-pcb_thick])
cylinder(h=3*1.6*MM,r=0.06*INCH,$fn=36);
translate([(1.7-0.1)*INCH,0.1*INCH,-pcb_thick])
cylinder(h=3*1.6*MM,r=0.06*INCH,$fn=36);
translate([0.1*INCH,(2.0-0.1)*INCH,-pcb_thick])
cylinder(h=3*1.6*MM,r=0.06*INCH,$fn=36);
translate([(1.7-0.1)*INCH,(2.0-0.1)*INCH,-1.6*MM])
cylinder(h=3*1.6*MM,r=0.06*INCH,$fn=36);
}
pins(x0=0.05*INCH,y0=(2.0-0.55)*INCH,n=9);
pins(x0=(1.7-0.05)*INCH,y0=(2.0-0.55)*INCH,n=11);
translate([0.5*INCH,2.0*INCH-6.3*MM,0])
usb_c();
}

