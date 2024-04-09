module body(base_length=80,base_width=25,base_height=13,top_length=35,top_width=25,top_height=8,top_offset=5,top=true,front_bumper=false,rear_bumper=false) {
    //base
    cube([base_length,base_width,base_height],center=true);
    //top
    if(top) {
        translate([top_offset,0,base_height/2+top_height/2 - 0.001])
            cube([top_length,top_width,top_height],center=true);
    }
    //rear bumper
    if(rear_bumper) {
    color("blue") {
        translate([base_length/2,0,0]) {
            rotate([90,0,0])
                cylinder(h=base_width-base_height,r=base_height/2,center=true);
            translate([0,-(base_width-base_height)/2,0])
                sphere(r=base_height/2);
            translate([0,(base_width-base_height)/2,0])
                sphere(r=base_height/2);
        }
    }
    }
    //front bumper
    if(front_bumper) {
    color("blue") {
        translate([-base_length/2,0,0]) {
            rotate([90,0,0])
                cylinder(h=base_width-base_height,r=base_height/2,center=true);
            translate([0,-(base_width-base_height)/2,0])
                sphere(r=base_height/2);
            translate([0,(base_width-base_height)/2,0])
                sphere(r=base_height/2);
        }
    }
    }
}
module simple_wheel(wheel_radius=10,wheel_width=6) {
    rotate([90,0,0])
        cylinder(h=wheel_width, r=wheel_radius, center=true);
}
module complex_wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2) {
    cylinder_height=2*wheel_radius; 
    difference() { 
        // Wheel sphere
        sphere(r=wheel_radius); 
        // Side sphere 1 
        translate([0,side_spheres_radius + hub_thickness/2,0])
            sphere(r=side_spheres_radius); 
        // Side sphere 2 
        translate([0,- (side_spheres_radius + hub_thickness/2),0])
            sphere(r=side_spheres_radius); 
        // Cylinder 1
        translate([wheel_radius/2,0,0])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
        // Cylinder 2 
        translate([0,0,wheel_radius/2])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
        // Cylinder 3 
        translate([-wheel_radius/2,0,0])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
        // Cylinder 4 
        translate([0,0,-wheel_radius/2])
            rotate([90,0,0])
            cylinder(h=cylinder_height,r=cylinder_radius,center=true); 
    }
}
module axle(track=36,radius=2) {
    rotate([90,0,0])
        cylinder(h=track, r=radius, center=true);
}
module axle_wheelset(track=36,radius=2) {
    translate([0,-track/2,0])
        children(0);
    axle(track=track,radius=radius);
    translate([0,track/2,0])
        children(1);
}
module spoked_wheel(radius=20,thickness=3,width=5,number_of_spokes=7,spoke_radius=2) {
    inner_radius=radius-thickness;
    difference() {
        rotate([90,0,0])
            cylinder(h=width,r=radius,center=true);
        rotate([90,0,0])
            cylinder(h=width+1,r=inner_radius,center=true);
    }
    spoke_length=radius-thickness/2;
    for(i=[0:1:number_of_spokes-1]) {
        angle=i*(360/number_of_spokes);
        rotate([0,angle,0])
            cylinder(h=spoke_length, r=spoke_radius);
    }
}
module rounded_simple_wheel(wheel_radius=12,wheel_width=3,tyre_diameter=6,axle_diameter=3) {
    difference() {
        //wheel
        rotate([90,0,0]) {
            rotate_extrude(angle=360) {
                difference() {
                    //cylindrical rim profile
                    translate([0,-wheel_width/2])
                        square([wheel_radius-tyre_diameter/2,wheel_width]);
                    //tyre profile
                    translate([wheel_radius-tyre_diameter/2,0])
                        circle(d=tyre_diameter);
                }
            }
        }
        //axle hole
        rotate([90,0,0])
            cylinder(h=wheel_width+1,r=axle_diameter/2,center=true);
      //cylinder(h=wheel_width,r=wheel_radius-tyre_diameter/2,center=true);
    }
}
module extruded_car_body(length=80,rear_height=20,rear_width=25,scaling_factor=0.5,rounded=false) {
    rotate([0,-90,0])
    linear_extrude(length,center=true,scale=0.5) {
        resize([rear_height,rear_width])
            circle(d=rear_height);
    }
    if(rounded) {
        translate([length/2,0,0])
            //rear part
            resize([rear_height,rear_width,rear_height])
                sphere(d=rear_height);
        translate([-length/2,0,0])
            //front part
            scale([scaling_factor,scaling_factor,scaling_factor])
            resize([rear_height,rear_width,rear_height])
                sphere(d=rear_height);
    }
}
car_length=80;
extruded_car_body(length=car_length,rounded=true);
translate([-car_length/3,0,0])
    axle_wheelset() {
        spoked_wheel();
        spoked_wheel();
    }
translate([car_length/3,0,0])
    axle_wheelset() {
        spoked_wheel();
        spoked_wheel();
    }
//rounded_simple_wheel(wheel_radius=20,wheel_width=6,tyre_diameter=4,axle_diameter=5);
//spoked_wheel();
/*axle_wheelset(radius=5) {
    complex_wheel(wheel_radius=20);
    simple_wheel(wheel_radius=20);
}*/
//body(top=true,front_bumper=true,rear_bumper=false);

//car spoiler
function naca_half_thickness(x,t) = 5*t*(0.2969*sqrt(x) - 0.1260*x - 0.3516*pow(x,2) + 0.2843*pow(x,3) - 0.1015*pow(x,4));
function naca_top_coordinates(t,n) = [for(x=[0:1/(n-1):1]) [x,naca_half_thickness(x,t)]];
function naca_bottom_coordinates(t,n) = [for(x=[1:-1/(n-1):0]) [x,-naca_half_thickness(x,t)]];
function naca_coordinates(t,n) = concat(naca_top_coordinates(t,n), naca_bottom_coordinates(t,n));
module naca_airfoil(chord,t,n) {
    points = naca_coordinates(t=t,n=n);
    scale([chord,chord,1])
        polygon(points);
}
module naca_wing(chord,t,n,span,center=false) {
    linear_extrude(height=span,center=center)
        naca_airfoil(chord,t,n);
}
module car_spoiler(top_chord=20,t=0.12,n=500,top_span=50,base_chord=15,base_span=15,base_gap=10) {
    translate([0,0,0.12+base_span]) {
        rotate([90,0,0])
            naca_wing(chord=top_chord,t=t,n=n,span=top_span,center=true);
        translate([0,base_gap,-base_span])
            naca_wing(chord=base_chord,t=t,n=n,span=base_span);
        translate([0,-base_gap,-base_span])
            naca_wing(chord=base_chord,t=t,n=n,span=base_span);
    }
}