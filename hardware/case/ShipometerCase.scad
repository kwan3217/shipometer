include <kwan_primitives.scad>
$fn=24;
include <RaspberryPi/raspberry/Pi5Boards.scad>
translate([42.5,27.8,0.0])
pi5();
include <Fan Sandwich.scad>
translate([0,0,15*MM])
color("#ffC0C0")
fan_sandwich();
translate([0,0,15*MM])
placed_fan();

M5_head_MM=6.5;
M5_hole_MM=3.0;

module foot() {
  difference() {
    union() {
      translate([0,0,-7])
      cylinder(7-1.6,3,3,$fn=24);
      translate([0,0,-7])
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
  translate([-9,-9,-5])
  linear_extrude(1)
  scale(0.5)
  text(str(M5_head_MM),font="Arial Black");
}
//color([1,0,0])
//cube([20,20,20],center=true);
}
