//resolution
$fa = 1;
$fs = 0.4;
wheel_radius = 8;
base_height = 7;
top_height = 8;
track = 36;
wheel_width = 5;
wheels_turn = -25;
body_roll = -wheels_turn/3;
scale([2,2,2]) {
    rotate([body_roll,0,0]) {
        //car body base
        cube([60,20,base_height], center=true);
        //car body top
        translate([5,0,base_height/2+top_height/2 - 0.001])
            cube([30,20,top_height],center=true);
    }
    //front left wheel
    translate([-20,-track/2,0])
        rotate([90,0,wheels_turn])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
    //front right wheel
    translate([-20,track/2,0])
        rotate([90,0,wheels_turn])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
    //rear left wheel
    translate([20,-track/2,0])
        rotate([90,0,0])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
    //rear right wheel
    translate([20,track/2,0])
        rotate([90,0,0])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
    //front axle
    translate([-20,0,0])
        rotate([90,0,0])
        cylinder(h=track,r=2,center=true);
    //rear axle
    translate([20,0,0])
        rotate([90,0,0])
        cylinder(h=track,r=2,center=true);
}