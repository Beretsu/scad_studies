use <vehicle_parts.scad>
simple_wheel_radius=10;
complex_wheel_radius=12;
top_length=7*simple_wheel_radius;
top_width=25;
top_height=8;
top_offset=0;
track=36;
base_length=10*simple_wheel_radius;
base_width=25;
base_height=13;
translate([0,0,base_height/2+top_height/2])
rotate([180,0,0])
body(base_length=base_length,base_width=base_width,base_height=base_height,top_length=top_length,top_offset=top_offset);
//bottom front axle
translate([-top_length/3,0,0])
axle(track=track);
//bottom center axle
axle(track=track);
//bottom rear axle
translate([top_length/3,0,0])
axle(track=track);
//top front axle
translate([2*top_length/3,0,base_height/2+top_height/2])
axle(track=track);
//top rear axle
translate([-2*top_length/3,0,base_height/2+top_height/2])
axle(track=track);
//bottom front left wheel
translate([-top_length/3,-track/2,0])
simple_wheel(wheel_radius=simple_wheel_radius);
//bottom front right wheel
translate([-top_length/3,track/2,0])
simple_wheel(wheel_radius=simple_wheel_radius);
//bottom center left wheel
translate([0,-track/2,0])
simple_wheel(wheel_radius=simple_wheel_radius);
//bottom center right wheel
translate([0,track/2,0])
simple_wheel(wheel_radius=simple_wheel_radius);
//bottom rear left wheel
translate([top_length/3,-track/2,0])
simple_wheel(wheel_radius=simple_wheel_radius);
//bottom rear right wheel
translate([top_length/3,track/2,0])
simple_wheel(wheel_radius=simple_wheel_radius);
//top front left wheel
translate([-2*top_length/3,-track/2,base_height/2+top_height/2])
complex_wheel(wheel_radius=complex_wheel_radius);
//top front right wheel
translate([-2*top_length/3,track/2,base_height/2+top_height/2])
complex_wheel(wheel_radius=complex_wheel_radius);
//top rear left wheel
translate([2*top_length/3,-track/2,base_height/2+top_height/2])
complex_wheel(wheel_radius=complex_wheel_radius);
//top rear right wheel
translate([2*top_length/3,track/2,base_height/2+top_height/2])
complex_wheel(wheel_radius=complex_wheel_radius);


