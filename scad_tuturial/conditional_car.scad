use <vehicle_parts.scad>
//conditional asigment of body variables
body_version="n";   //s-short, n-normal, l-large, r-rectangular
//base_length
base_length=
(body_version=="l") ? 80:
(body_version=="s") ? 60:
(body_version=="r") ? 65:70;
//top_length
top_length=
(body_version=="l") ? 50:
(body_version=="s") ? 30:
(body_version=="r") ? 65:40;
//top_offset
top_offset=
(body_version=="l") ? 10:
(body_version=="s") ? 5:
(body_version=="r") ? 0:7.5;

top=true;
front_bumper=true;
rear_bumper=false;
//creation of body
body(base_length=base_length,top_length=top_length,top_offset=top_offset,top=top,front_bumper=front_bumper,rear_bumper=rear_bumper);
//conditional assigment of wheel variables
wheels_version="m"; //s-small, m-medium, l-large
//wheel_radius
wheel_radius=
(wheels_version=="l") ? 10:
(wheels_version=="m") ? 9:8;
//wheel_radius
wheel_width=
(wheels_version=="l") ? 8:
(wheels_version=="m") ? 6:4;
track=30;
wheelbase=40;
//creation of wheels and axles
//front axle_wheelset
translate([wheelbase/2,0,0])
    axle_wheelset(track) {
        simple_wheel(wheel_radius=wheel_radius,wheel_width=wheel_width);
        simple_wheel(wheel_radius=wheel_radius,wheel_width=wheel_width);
    }
//rear axle_wheelset
translate([-wheelbase/2,0,0])
    axle_wheelset(track) {
        simple_wheel(wheel_radius=wheel_radius,wheel_width=wheel_width);
        simple_wheel(wheel_radius=wheel_radius,wheel_width=wheel_width);
    }
        