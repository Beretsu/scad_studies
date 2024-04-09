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
spoked_wheel();