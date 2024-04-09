module badplate(h=4) {
  //children();
  hull(){
    intersection(){
      children();
      translate([0,0,0]) #cube([h,h,h],center=true);
    }
  }
}
badplate() {
    cylinder(h=5,r=1);
    translate([0,0,-3]) cube([4,2,8]);
}

 *hull(){
    intersection(){
      cylinder(h=5,r=1);
    translate([0,0,-3]) cube([4,2,8]);
      translate([0,0,0]) cube([4,4,4],center=true);
    }
  }
/*cylinder(h=5,r=1);
    translate([0,0,-3]) cube([4,2,8]);*/