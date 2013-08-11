//Definitions
slide_dim = [30, 10, 1];
kmpr_dim = [30, 10, 0.2];
pad_center_dim = [10, 5, 0.5];
pad_connect_dim = [15, 1, 0.5];
pad_circle_r = 1;
pad_circle_h = 2;
plus1_dim = [1.5, 0.5, 0.5];
plus2_dim = [0.5, 1.5, 0.5];

glass_col = [.85, .95, 1];
kmpr_col = [.85, .74, .22];
ni_col = [.55, .55, .55];

//Glass Slide
color(glass_col) cube(slide_dim);

//KMPR Photoresist layer
//color(kmpr_col) translate([0, 0, 1.1]) cube(kmpr_dim);

//Pad removed from KMPR
difference() {
	color(kmpr_col) translate([0, 0, 1.1]) cube(kmpr_dim);
	color(kmpr_col) translate([12, 2.5, .9]) cube(pad_center_dim);
	color(kmpr_col) translate([3, 6.5, .9]) cube(pad_connect_dim);
	color(kmpr_col) translate([3, 6.5, .9]) cube(pad_connect_dim);
	color(kmpr_col) translate([4, 8.5, .9]) cube(plus1_dim);
	color(kmpr_col) translate([4.5, 8.0, .9]) cube(plus2_dim);
	color(kmpr_col) translate([3, 7, 1.8]) cylinder(h=pad_circle_h, r=pad_circle_r, $fn=50, center=true);
} 

//Nickel pad 
/*union() {
	color(ni_col) translate([12, 2.5, 0.5]) cube(pad_center_dim);
	color(ni_col) translate([3, 6.5, 0.5]) cube(pad_connect_dim);
	color(ni_col) translate([3, 6.5, 0.5]) cube(pad_connect_dim);
	color(ni_col) translate([4, 8.5, 0.5]) cube(plus1_dim);
	color(ni_col) translate([4.5, 8.0, 0.5]) cube(plus2_dim);
	color(ni_col) translate([3, 7, 1.8]) cylinder(h=pad_circle_h, r=pad_circle_r, $fn=50, center=true);
}*/