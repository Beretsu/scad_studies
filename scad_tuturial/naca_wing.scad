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
car_spoiler();