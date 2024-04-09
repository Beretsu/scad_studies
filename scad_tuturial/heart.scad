module heart(h=10,n=20) {
    function heart_coordinates(t) = [16*pow(sin(t),3), 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)];
    function heart_points(n=20) = [for(t=[0:360/n:359.999]) heart_coordinates(t)];
    points=heart_points(n=n);
    linear_extrude(height=h)
        polygon(points);
}
n=20;
h=10;
step=360/n;
function heart_coordinates(t) = [16*pow(sin(t),3), 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)];
function heart_points(n=20) = [for(t=[0:360/n:359.999]) heart_coordinates(t)];
pointss=heart_points(n=n);
points=[for(t=[0:step:360.999]) [16*pow(sin(t),3), 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)]];
linear_extrude(height=h)
    polygon(pointss);

point1=[for(i=[1:6]) i];
echo(point1);
point2=[for(i=[10:-2:-2]) i];
echo(point2);
point3=[for(i=[3:1:6]) [i,i*10]];
echo(point3);
translate([40,0,0])
    heart();