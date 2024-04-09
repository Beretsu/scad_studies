track = 36; //width of axle
wheels_turn = -20;
body_roll = -wheels_turn/4;
base_length = 126;
base_width = 20;
base_height = 20;
top_length = 48;
top_width = 18;
top_height = 8;
top_offset = 7;
wheel_radius_front=10;
side_spheres_radius_front=50;
hub_thickness_front=4;
cylinder_radius_front=2;
wheel_radius_rear=12;
side_spheres_radius_rear=30;
hub_thickness_rear=5;
cylinder_radius_rear=3;
front_axle_offset=-30;
middle_axle_offset=5;
rear_axle_offset=30;
module wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2) {
    cylinder_height=wheel_radius*2;
    difference() {
        //wheel sphere
        sphere(r=wheel_radius);
        //side sphere 1
        translate([0,side_spheres_radius+hub_thickness/2,0])
            sphere(r=side_spheres_radius);
        //side sphere 2
        translate([0,-(side_spheres_radius+hub_thickness/2),0])
            sphere(r=side_spheres_radius);
        //cylinder 1
        translate([wheel_radius/2,0,0])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true);
        //cylinder 2
        translate([-wheel_radius/2,0,0])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true);
        //cylinder 3
        translate([0,0,wheel_radius/2])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true);
        //cylinder 4
        translate([0,0,-wheel_radius/2])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true);
    }
}
module body(base_length=80,base_width=20,base_height=13,top_length=35,top_width=14,top_height=6,top_offset=5) {
    //car body base
    resize([base_length,base_width,base_height])
    sphere(r=base_length/2);
    //car body top
    translate([top_offset,0,base_height/3])
        resize([top_length,top_width,top_height*2])
            sphere(r=top_length/2);
}
module axle(track=36, radius=2){
    rotate([90,0,0])
        cylinder(h=track, r=radius, center = true);
}
scale([2,2,2]) {
    rotate([body_roll,0,0]) {
        body(base_length=base_length,base_width=base_width,base_height=base_height,top_length=top_length,top_width=top_width,top_height=top_height,top_offset=top_offset);
    }
    //front left wheel
    translate([front_axle_offset,-track/2,0])
        rotate([0,0,wheels_turn])
        wheel();
    //front right wheel
    translate([front_axle_offset,track/2,0])
        rotate([0,0,wheels_turn])
        wheel();
    //rear left wheel
    translate([rear_axle_offset,-track/2,0])
        rotate([0,0,0])
        wheel(wheel_radius=wheel_radius_rear,side_spheres_radius=side_spheres_radius_rear,hub_thickness=hub_thickness_rear,cylinder_radius=cylinder_radius_rear);
    //rear right wheel
    translate([rear_axle_offset,track/2,0])
        rotate([0,0,0])
        wheel(wheel_radius=wheel_radius_rear,side_spheres_radius=side_spheres_radius_rear,hub_thickness=hub_thickness_rear,cylinder_radius=cylinder_radius_rear);
    //middle left wheel
    translate([middle_axle_offset,-track/2,0])
        wheel(cylinder_radius=cylinder_radius_rear, wheel_radius=wheel_radius_rear);
    //middle right wheel
    translate([middle_axle_offset,track/2,0])
        wheel(cylinder_radius=cylinder_radius_rear, wheel_radius=wheel_radius_rear);
    //front axle
    translate([front_axle_offset,0,0])
        axle(track=track);
    //rear axle
    translate([rear_axle_offset,0,0])
        axle(track=track);
    //middle axle
    translate([middle_axle_offset,0,0])
        axle(track=track);
}