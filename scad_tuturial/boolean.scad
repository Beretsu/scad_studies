/*union() {
    sphere(r=10);
    translate([7,0,0])
        sphere(r=10);
}*/
/*difference() {
    sphere(r=10);
    translate([7,0,0])
        sphere(r=10);
}*/
/*difference() {
    sphere(r=10);
    translate([7,0,0])
        sphere(r=10);
    translate([0,7,0])
        sphere(r=10);
}*/
intersection() {
    sphere(r=10);
    translate([7,0,0])
        sphere(r=10);
    translate([0,7,0])
        sphere(r=10);
}