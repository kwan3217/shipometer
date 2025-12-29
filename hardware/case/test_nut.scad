difference() {
    cube([25,2,12]);
    translate([6,1,6])
    rotate([-90,0,0])
    cylinder(h=5.0,r=4.582734,$fn=6);
    translate([6,-1,6])
    rotate([-90,0,0])
    cylinder(h=5.0,r=3.2,$fn=36);
    translate([18,1,6])
    rotate([-90,0,0])
    cylinder(h=5.0,r=4.61895,$fn=6);
    translate([18,-1,6])
    rotate([-90,0,0])
    cylinder(h=5.0,r=3.2,$fn=36);
}