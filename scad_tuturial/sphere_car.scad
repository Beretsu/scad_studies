//resolution
$fa = 1;
$fs = 0.4;
wheel_radius = 8;
track = 36;
wheel_width = 6;
wheels_turn = -20;
body_roll = wheels_turn/4;
base_length = 80;
base_width = 20;
base_height = 13;
top_length = 35;
top_width = 14;
top_height = 6;
scale([2,2,2]) {
    rotate([body_roll,0,0]) {
        //car body base
        resize([base_length,base_width,base_height])
        sphere(r=base_length/2);
        //car body top
        translate([5,0,base_height/3 - 0.001])
            resize([top_length,top_width,top_height*2])
            sphere(r=top_length/2);
    }
    //front left wheel
    translate([-20,-track/2,0])
        rotate([0,0,wheels_turn])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
        sphere(r=wheel_radius);
    //front right wheel
    translate([-20,track/2,0])
        rotate([0,0,wheels_turn])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
        sphere(r=wheel_radius);
    //rear left wheel
    translate([20,-track/2,0])
        rotate([0,0,0])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
        sphere(r=wheel_radius);
    //rear right wheel
    translate([20,track/2,0])
        rotate([0,0,0])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
        sphere(r=wheel_radius);
    //front axle
    translate([-20,0,0])
        rotate([90,0,0])
        cylinder(h=track,r=2,center=true);
    //rear axle
    translate([20,0,0])
        rotate([90,0,0])
        cylinder(h=track,r=2,center=true);
}