use <vehicle_parts.scad>

//model parameters
h=14;

d1=30;
d2=20;
d3=20;
d4=10;
d5=20;

w1=15;
w2=45;
w3=25;

//distances to lengths
l1=d1;
l2=d1+d2;
l3=d1+d2+d3;
l4=d1+d2+d3+d4;
l5=d1+d2+d3+d4+d5;

//right side
p0=[0,w1/2];
p1=[l1,w1/2];
p2=[l2,w2/2];
p3=[l3,w2/2];
p4=[l4,w3/2];
p5=[l5,w3/2];

//left side
p6=[l5,-w3/2];
p7=[l4,-w3/2];
p8=[l3,-w2/2];
p9=[l2,-w2/2];
p10=[l1,-w1/2];
p11=[0,-w1/2];

//all points
points=[p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11];

//extruded body profile
linear_extrude(h)
polygon(points);

//spherical body top
top_radius=w3/2;
top_center=l1+(l4-l1)/2;
top_offset=2;
translate([top_center+top_offset,0,h])
    scale([2,1,1])
    sphere(r=top_radius);

//front axle_wheelset
front_track=w1*2;
front_wheel_radius=12;
translate([l1/2,0,h/2])
axle_wheelset(front_track) {
    simple_wheel(wheel_radius=front_wheel_radius);
    simple_wheel(wheel_radius=front_wheel_radius);
}

//rear axle_wheelset
rear_track=w3*2;
rear_wheel_radius=13;
translate([l5-d3/2,0,h/2])
axle_wheelset(rear_track) {
    simple_wheel(wheel_radius=rear_wheel_radius);
    simple_wheel(wheel_radius=rear_wheel_radius);
}

//car spoiler
translate([l4+d5/4,0,h-0.001])
car_spoiler();