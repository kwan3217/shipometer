include<kwan_primitives.scad>
include<zed-f9r.scad>

translate([1.7*INCH,2*INCH,0])
rotate([0,0,180])
zed_f9r();

EPS=0.2*MM;
OVERLAP=1.0*MM;

module post() {
    translate([0,0,-11*MM])
    cylinder(h=11*MM,r=0.1*INCH,$fn=36);
    cylinder(h=1.8*MM,r1=0.06*INCH-0.5*MM,r2=0,$fn=36);
    translate([-0.1*INCH-2*MM,-0.1*INCH-1.5*MM,-11*MM])
    cube([0.2*INCH+2*MM,0.1*INCH+1.5*MM,11*MM]);
    translate([-0.1*INCH-2*MM,-0.1*INCH-1.5*MM,-11*MM])
    cube([0.1*INCH+2*MM,0.2*INCH+1.5*MM,11*MM]);
}

module case() {
difference() {
  //main body
  translate([-2.5*MM,-2.5*MM,-12*MM])
  rounded_cube(1.7*INCH+5*MM,2.2*INCH+5*MM,20*MM);
  
  //main hollow
  translate([-EPS,-EPS,-10*MM])
  cube([1.7*INCH+2*EPS,2.2*INCH+2*EPS,20*MM]);
  
  //lid cutout
  translate([-EPS,2*INCH,6*MM-EPS])
  cube([1.7*INCH+2*EPS,1*INCH,1*INCH]);
  
  //usb cutout
  translate([1.2*INCH,-3*MM,-(3*1.2-3)*MM])
  scale([1.2,1.2,1.2])
  usb_c();
  
  //sma cutout
  translate([18*MM,-2*MM,-5.9*MM]) {
    translate([0,1*MM,0])
    rotate([-90,0,0])
    cylinder(h=5.0*MM,r=4.7*MM,$fn=6);
    translate([0,-1*MM,0])
    rotate([-90,0,0])
    cylinder(h=5.0*MM,r=3.3*MM,$fn=36);
  }
  
  //left rail
  translate([-EPS,-0.5*MM,6*MM])
  rotate([0,-45,0])
  cube([sqrt(2),2.4*INCH,sqrt(2)]);
  
  //right rail
  translate([1.7*INCH+EPS,-0.5*MM,6*MM])
  rotate([0,-45,0])
  cube([sqrt(2),2.4*INCH,sqrt(2)]);
  

  // RC logo
  translate([-3.5*MM,0.6*INCH,-8.5*MM])
  rotate([0,0,90])
  rotate([90,0,0])
  linear_extrude(2*MM)
  scale(1.0)
  import("crown_anchor.svg");

  // dcl logo
  translate([-1.5*MM,2.1*INCH,-7*MM])
  rotate([0,0,-90])
  rotate([90,0,0])
  linear_extrude(2*MM)
  scale(0.5)
  import("dcl.svg");

  
  //Text
  translate([1.7*INCH+1*MM+1*MM,0,0])
  rotate([0,0,90])
  rotate([90,0,0])
  union() {
  linear_extrude(2*MM)
  scale(0.5)
  text("Shipometer",font="Arial Black");
  translate([0,-8*MM,0])
  linear_extrude(2*MM)
  scale(0.5)
  text("Jr Jr 2025.11",font="Arial Black");
  }
}




translate([0.1*INCH,0.1*INCH,0])
post();
translate([1.6*INCH,0.1*INCH,0])
rotate([0,0,90])
post();
translate([1.6*INCH,1.9*INCH,0])
rotate([0,0,180])
post();
translate([0.1*INCH,1.9*INCH,0])
rotate([0,0,270])
post();

translate([-0.5*MM,1.8*INCH,pcb_thick+1*MM])
rotate([-90,0,0])
cylinder(h=0.2*INCH,r1=0.6*MM,r2=0.6*MM,$fn=36);
translate([1.7*INCH+0.5*MM,1.8*INCH,pcb_thick+1*MM])
rotate([-90,0,0])
cylinder(h=0.2*INCH,r1=0.6*MM,r2=0.6*MM,$fn=36);

}

module screen(angle=30,land=1.5,pit=1.5,h=100,d=100,i0=-15,i1=15) {
  union() {
    for(i=[i0:i1]) {
      translate([i*(land+pit)/cos(angle),0,-h])
      rotate([0,0,-angle])
      cube([land,d/sin(angle),h]);
    }
  }
}


module grille_logo(svg,
  scale_to_1inch,
  land,
  pit,
  angle,
  i0,
  i1) {
  difference() {
    translate([0,0,-2*MM])
    linear_extrude(4*MM)
    scale(scale_to_1inch) //This makes it a perfect 1 inch circle
    import(svg);
    screen(angle,land,pit,i0=i0,i1=i1);
  }
}
  

module lid() {
  difference() {
  //main lid
  translate([0*MM,-0.5*MM,6*MM])
  cube([1.7*INCH,2.2*INCH+3*MM,2*MM]);
  // kwan logo
  translate([(1.7/2-0.5)*INCH,0.5*INCH,7*MM])
  grille_logo("kwan.svg",0.23/1.7,1*MM,1*MM,60,-10,10);
  }
  //left rail
  translate([0*MM,-0.5*MM,6*MM])
  rotate([0,-45,0])
  cube([sqrt(2),2.2*INCH+3*MM,sqrt(2)]);
  
  //right rail
  translate([1.7*INCH,-0.5*MM,6*MM])
  rotate([0,-45,0])
  cube([sqrt(2),2.2*INCH+3*MM,sqrt(2)]);

}

case();
color("#ff8000") lid();
