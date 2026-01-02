// Coordinate frame -- 
// origin is on plane of top surface of Pi board, where 

include <kwan_primitives.scad>
$fn=24;
include <RaspberryPi/raspberry/Pi5Boards.scad>
translate([42.5,28,-pcbT/2*MM])pi5(heatSink=true);
translate([0,0,15*MM+6*MM+2*MM])
scale([1,1,1.6*MM/pcbT])
translate([32.5,28.25,pcbT/2*MM])
pi5HatPcb(resist="purple");
include <Fan Sandwich.scad>
translate([0,0,15*MM])color("#ffC0C0")fan_sandwich();
//15mm standoffs
translate([0,0,15*MM])placed_fan();
translate([3.5*MM,3.5*MM,0*MM])
cylinder(15*MM,r=2.8868*MM,$fn=6);
translate([(3.5+58)*MM,3.5*MM,0*MM])
cylinder(15*MM,r=2.8868*MM,$fn=6);
translate([3.5,(3.5+49)*MM,0*MM])
cylinder(15*MM,r=2.8868*MM,$fn=6);
translate([(3.5+58)*MM,(3.5+49)*MM,0*MM])
cylinder(15*MM,r=2.8868*MM,$fn=6);

//6mm standoffs
translate([3.5*MM,3.5*MM,15*MM+2*MM])
cylinder(6*MM,r=2.8868*MM,$fn=6);
translate([(3.5+58)*MM,3.5*MM,15*MM+2*MM])
cylinder(6*MM,r=2.8868*MM,$fn=6);
translate([3.5,(3.5+49)*MM,15*MM+2*MM])
cylinder(6*MM,r=2.8868*MM,$fn=6);
translate([(3.5+58)*MM,(3.5+49)*MM,15*MM+2*MM])
cylinder(6*MM,r=2.8868*MM,$fn=6);

M5_head_MM=6.5;
M5_hole_MM=3.0;

module foot() {
  difference() {
    union() {
      translate([0,0,-7*MM])
      cylinder(7*MM-pcbT,3,3,$fn=24);
      translate([0,0,-7*MM])
      cylinder(3,5,5,$fn=24);
    }
    union() {
      translate([0,0,-7.5])
      color("blue")
      cylinder(h=8,r=M5_hole_MM/2,$fn=24);
      color([1,0,0])
      translate([0,0,-7.5])
      cylinder(2,M5_head_MM/2,M5_head_MM/2,$fn=6);
    }
  }
}

module feet() {
translate([3.5,3.5,0])
foot();
translate([3.5+58,3.5,0])
foot();

translate([0,49,0])
union() {
translate([3.5,3.5,0])
foot();
translate([3.5+58,3.5,0])
foot();
}
}


module anchor() {
linear_extrude(5,center=true)
scale(3)
import("crown_anchor.svg");
}

module screen(angle=30,land=1.5,pit=1.5,h=100,d=100,i0=-15,i1=15) {
union() {
for(i=[i0:i1]) {
translate([i*(land+pit)/cos(angle),0,0])
rotate([0,0,-angle])
cube([land,d/sin(angle),h]);
}
}
}

module anchor_screen() {
difference() {
anchor();
screen();
}
}


module bottom_plate() {
difference() {
translate([-10,-10,-7])
rounded_cube(105,76,2);
translate([3.5,3.5,-8.5])
cylinder(5,M5_head_MM/2,M5_head_MM/2,$fn=24);
translate([3.5+58,3.5,-8.5])
cylinder(5,M5_head_MM/2,M5_head_MM/2,$fn=24);
translate([3.5,3.5+49,-8.5])
cylinder(5,M5_head_MM/2,M5_head_MM/2,$fn=24);
translate([3.5+58,3.5+49,-8.5])
cylinder(5,M5_head_MM/2,M5_head_MM/2,$fn=24);
translate([15,10,-6])
anchor_screen();
}
}

intersection() {
  union() {
    feet();
    bottom_plate();
  }
}
