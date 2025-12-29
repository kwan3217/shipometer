INCH=25.4; // multiply a measurement in inches by this to get mm
MM=1; // for completeness and readability


module rounded_cube(l,w,h,r=2*MM) {
  union() {
    translate([r,0,0])
    cube([l-2*r,w,h]);
    translate([0,2,0])
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

