//Definitions
slide_dim = [30, 10, 1.2];
kmpr_dim = [30, 10, 0.2];
pattern_dim = [.4, .4, 0.3];
pad_nioh2_dim = [10, 5, 0.9];
pad_center_dim = [10, 5, 0.5];
pad_connect_dim = [15, 1, 0.5];
pad_circle_r = 1;
pad_circle_h = .2;
plus1_dim = [1.5, 0.5, 0.5];
plus2_dim = [0.5, 1.5, 0.5];

glass_col = [.85, .95, 1];
kmpr_col = [.85, .74, .22, 0.5];
ni_col = [.55, .55, .55];
niox_col = [.44, .44, .44];
nioh2_col = [.11, .77, .22, .5];

//Glass Slide
color(glass_col) cube(slide_dim);

//KMPR Photoresist layer
//color(kmpr_col) translate([0, 0, 1.1]) cube(kmpr_dim);

//Pad removed from KMPR
/*
difference() {
	color(kmpr_col) translate([0, 0, 1.1]) cube(kmpr_dim);
	color(kmpr_col) translate([12, 2.5, .9]) cube(pad_center_dim);
	color(kmpr_col) translate([3, 6.5, .9]) cube(pad_connect_dim);
	color(kmpr_col) translate([3, 6.5, .9]) cube(pad_connect_dim);
	color(kmpr_col) translate([4, 8.5, .9]) cube(plus1_dim);
	color(kmpr_col) translate([4.5, 8.0, .9]) cube(plus2_dim);
	color(kmpr_col) translate([3, 7, 1.25]) cylinder(h=pad_circle_h, r=pad_circle_r, $fn=50, center=true);
}*/

//Nickel pad 
union() {
	color(ni_col) translate([12, 2.5, .9]) cube(pad_center_dim);
	color(ni_col) translate([3, 6.5, .9]) cube(pad_connect_dim);
	color(ni_col) translate([3, 6.5, .9]) cube(pad_connect_dim);
	color(ni_col) translate([4, 8.5, .9]) cube(plus1_dim);
	color(ni_col) translate([4.5, 8.0, .9]) cube(plus2_dim);
	color(ni_col) translate([3, 7, 1.3]) cylinder(h=pad_circle_h, r=pad_circle_r, $fn=50, center=true);
}

//KMPR mask on top of nickel pad
//color(kmpr_col) translate([0, 0, 1.4]) cube(kmpr_dim);

//Pattern developed into KMPR mask
/*difference() {
	color(kmpr_col) translate([0, 0, 1.35]) cube(kmpr_dim);
	for (i = [0:8], j = [0:4]) {
		translate([i + 13, j + 2.5, 1.3]) cube(pattern_dim);
	}
}*/

//Nickel oxide pattern
for (i = [0:8], j = [0:4]) {
		translate([i + 13, j + 2.5, 1.5]) color(niox_col) cube(pattern_dim);
	}

//Nickel hydroxide layer
color(nioh2_col) translate([12, 2.5, .9]) cube(pad_nioh2_dim);
for (i = [0:8], j = [0:4]) {
		translate([i + 13, j + 2.5, 1.6]) color(nioh2_col) cube(pattern_dim);
	}
