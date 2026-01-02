MM=1;
INCH=25.4*MM;



module daisy() {
  board_w=3.0*INCH;
  board_d=1.95*INCH;
  board_h=1.6*MM;
  module daisy_main_board() {
    hole_r=3.0*MM/2;
    // clearances between edge of hole and edge of board measured by outside caliper
    hole_x1=        2.5*MM;
    hole_x2=board_w-2.6*MM;
    hole_y1=        2.7*MM;
    hole_y2=board_d-2.0*MM;
    color("green")
    translate([0,0,-board_h])
    difference() {
      // substrate
      cube([board_w,board_d,board_h]);
      // mounting holes
      translate([hole_x1+hole_r,hole_y1+hole_r,-1*MM])
      cylinder(h=2*MM+board_h,r=hole_r,$fn=24);
      translate([hole_x2-hole_r,hole_y1+hole_r,-1*MM])
      cylinder(h=2*MM+board_h,r=hole_r,$fn=24);
      translate([hole_x1+hole_r,hole_y2-hole_r,-1*MM])
      cylinder(h=2*MM+board_h,r=hole_r,$fn=24);
      translate([hole_x2-hole_r,hole_y2-hole_r,-1*MM])
      cylinder(h=2*MM+board_h,r=hole_r,$fn=24);
    }
  }
  daisy_main_board();
  module bnc() {
    cube_w=14.5*MM;
    cube_d=14.5*MM;
    cube_h=17.1*MM-board_h;
    color("#c0c0c0")
    union() {
      cube([cube_w,cube_d,cube_h]);
      // thread
      thread_r=0.48*INCH/2;
      thread_d=23.2*MM-cube_d;
      thread_square=10.7*MM;
      intersection() {
        translate([cube_w/2,1*MM,15.3*MM-board_h-thread_r])
        rotate([90,0,0])
        cylinder(h=thread_d+1*MM,r=thread_r);
        translate([cube_w/2,1*MM,15.3*MM-board_h-thread_r])
        cube([thread_square,20*MM,thread_square],center=true);
      }
      // barrel
      barrel_r=0.37*INCH/2;
      barrel_d=35.2*MM-cube_d-thread_d;
      translate([cube_w/2,1*MM-thread_d,15.3*MM-board_h-thread_r])
      rotate([90,0,0])
      cylinder(h=barrel_d+1*MM,r=barrel_r);
    }
  }
  translate([55*MM,0.5*MM,0*MM])
  bnc();
}

daisy();