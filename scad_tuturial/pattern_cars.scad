use <vehicle_parts.scad>

// Variables
track = 30;
wheelbase=40;
module car(track=30,wheelbase=40) {
// Body
body();
// Front left wheel 
translate([-wheelbase/2,-track/2,0])
    rotate([0,0,0])
    simple_wheel();
 // Front right wheel 
translate([-wheelbase/2,track/2,0])
    rotate([0,0,0])
    simple_wheel();
// Rear left wheel 
translate([wheelbase/2,-track/2,0])
    rotate([0,0,0])
    simple_wheel();
// Rear right wheel 
translate([wheelbase/2,track/2,0])
    rotate([0,0,0])
    simple_wheel();
// Front axle 
translate([-wheelbase/2,0,0])
    axle(track=track); 
// Rear axle 
translate([wheelbase/2,0,0])
    axle(track=track);
}
/*for(dx=[0:90:630]) {
translate([dx,0,0])
    car();
}*/
/*for(i=[0:1:4]) {
translate([i*90,i*50,0])
    rotate([0,0,i*90])
    car();
}*/
/*r=200;
for(i=[0:36:359]) {
    translate([r*cos(i),r*sin(i),0])
        car();
}*/
/*r=180;  //patern radius
n=12;   //number of cars
step=360/n;
for(i=[0:step:359]) {
    angle=i;
    dx=r*cos(angle);
    dy=r*sin(angle);
    translate([dx,dy,0])
    rotate([0,0,angle-90])
    car();
}*/
/*n=6; //number of cars
nrows=4;    //number of rows
y_spacing=50;
x_spacing=90;
for(dx=[0:x_spacing:nrows*x_spacing-1]) {
    for(dy=[0:y_spacing:n*y_spacing-1]) {
        translate([dx,dy,0])
            car();
    }
}*/
/*r=180;  //patern radius
number_of_turns=3;
radius_increment=90;
n=14;   //number of cars
for(radius=[r:radius_increment:r+(radius_increment*number_of_turns-1)]) {
    for(i=[0:360/n:359]) {
        translate([radius*cos(i),radius*sin(i),0])
        rotate([0,0,i])
            car();
    }
}*/
initial_radius=180;
number_of_turns=3;
radius_increment=90;
initial_num_of_cars=12;
for(i=[0:1:number_of_turns-1]) {
    r=initial_radius+radius_increment*i;
    n=initial_num_of_cars+2*i;
    for(angle=[0:360/n:359]) {
        translate([r*cos(angle),r*sin(angle),0])
            rotate([0,0,angle])
            car();
    }
}