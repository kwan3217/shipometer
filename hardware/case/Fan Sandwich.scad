EPS=0.5*MM;

M5_hole_MM=3.0;


module rounded_cube(l,w,h,r=2*MM) {
  union() {
    translate([r,0,0])
    cube([l-2*r,w,h]);
    translate([0,r,0])
    cube([l,w-2*r,h]);
    translate([r,r,0])
    cylinder(h=h,r1=r,r2=r,$fn=36);
    translate([r,w-r,0])
    cylinder(h=h,r1=r,r2=r,$fn=36);
    translate([l-r,r,0])
    cylinder(h=h,r1=r,r2=r,$fn=36);
    translate([l-r,w-r,0])
    cylinder(h=h,r1=r,r2=r,$fn=36);
  }
}


module fan_sandwich_bottom_plate() {
difference() {
//main body
translate([0,0,0])
rounded_cube((58+7)*MM,56*MM,2*MM);

//corner holes
translate([3.5*MM,3.5*MM,-1*MM])
cylinder(5,M5_hole_MM/2,M5_hole_MM/2,$fn=24);
translate([(3.5+58)*MM,3.5*MM,-1])
cylinder(5,M5_hole_MM/2,M5_hole_MM/2,$fn=24);
translate([3.5,(3.5+49)*MM,-1])
cylinder(5,M5_hole_MM/2,M5_hole_MM/2,$fn=24);
translate([(3.5+58)*MM,(3.5+49)*MM,-1*MM])
cylinder(5,M5_hole_MM/2,M5_hole_MM/2,$fn=24);

//GPIO hole
translate([(3.5+29)*MM,(3.5+49)*MM,1*MM])
cube([2*INCH+EPS*2,0.2*INCH+EPS,4*MM],center=true);
translate([(3.5+29)*MM-1*INCH+15*MM,(56/2)*MM,-1])
cylinder(h=4*MM,r1=28/2*MM,r2=28/2*MM);
}
}

module fan_hook() {
  translate([-2*MM,-2.5*MM,-1*MM])
  difference(){
  cube([3*MM,5*MM,10*MM+EPS*2]);
  translate([2*MM,-1*MM,-1*MM])
  cube([5*MM,7*MM,9*MM+EPS*2]);
  color("blue")
  translate([0*MM,-1*MM,12*MM])
  rotate([0,45,0])
  cube([5*MM,7*MM,5*MM]);
  }
}

module fan_hole() {
translate([0,0,(7.7/2+1)*MM])
rotate([180,0,0])
union(){
cylinder(h=(7.7/2+1)*MM,r1=4.5*MM/2,r2=4.5*MM/2,$fn=24);
cylinder(h=(7.7+2)*MM,r1=3.2*MM/2,r2=3.2*MM/2,$fn=24);
}
}

module fan() {
  difference() {
    translate([-30.4/2*MM,-30.4/2*MM,-7.7/2*MM])
    rounded_cube(30.4*MM,30.4*MM,7.7*MM,r=3.2*MM);
    
    translate([0,0,-(7.7+1)/2*MM])
    cylinder(h=9.7*MM,r1=27/2*MM,r2=27/2*MM);

    translate([-12*MM,-12*MM,0])
    fan_hole();
    translate([12*MM,-12*MM,0])
    fan_hole();
    translate([-12*MM,12*MM,0])
    fan_hole();
    translate([12*MM,12*MM,0])
    fan_hole();
  }
}

module fan_pegs() {
    translate([-12*MM,-12*MM,-2*MM])
    cylinder(h=3*MM,r=(4*MM-EPS)/2,$fn=24);
    translate([12*MM,-12*MM,-2*MM])
    cylinder(h=3*MM,r=(4*MM-EPS)/2,$fn=24);
    translate([-12*MM,12*MM,-2*MM])
    cylinder(h=3*MM,r=(4*MM-EPS)/2,$fn=24);
    translate([12*MM,12*MM,-2*MM])
    cylinder(h=3*MM,r=(4*MM-EPS)/2,$fn=24);
}

module fan_sandwich() {
  union() {
  fan_sandwich_bottom_plate();

  translate([(3.5+29)*MM-1*INCH+15*MM,(56/2)*MM,0])color("orange")fan_pegs();
    translate([(3.5+29)*MM-1*INCH+15*MM,(56/2)*MM+15*MM,0])
    rotate([0,0,-90])
    rotate([180,0,0])
    fan_hook();
  }
}

module placed_fan() {
  translate([(3.5+29)*MM-1*INCH+15*MM,(56/2)*MM,-7.7/2*MM])
  color("black")
  fan();
}

// Uncomment this if you want to actually print it
//rotate([180,0,0]) fan_sandwich();