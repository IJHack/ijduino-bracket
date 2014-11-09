// PCB dimensions
pcb_length = 50.20;
pcb_width  = 32.20;
pcb_height = 1.20;



// Mockup of our PCB to make things easy to model
module pcbmockup() {
	difference() {
		// PCB board
		color("green")
		cube([pcb_length,
			pcb_width,
			pcb_height],
			false);

		// Top left hole stamp
		translate([2.30, 2.30, 0])
		cylinder(h = 3, d = 3);
		// Top right hole stamp
		translate([2.30, 30.10])
		cylinder(h = 3, d = 3);
		// Bottom left hole stamp
		translate([48.20, 2.20])
		cylinder(h = 3, d = 3);
		// Bottom right hole stamp
		translate([48.20, 30.20])
		cylinder(h = 3, d = 3);
	}
}

module bracket() {
	brkt_padding = 2;
	brkt_mounts  = 5;

	brkt_length = brkt_padding + pcb_length;
	brkt_width  = brkt_padding + pcb_width;
	brkt_height = brkt_padding + pcb_height;

	difference() {
		translate([-(brkt_padding / 2),
			-(brkt_padding / 2),
			-(brkt_padding + pcb_height)-brkt_mounts])
		cube([brkt_length, brkt_width, brkt_height],
			false);

		translate([brkt_mounts + brkt_padding,
			brkt_mounts + brkt_padding,
			-10])
		color("blue")
		cube([(brkt_length - 16),
			(brkt_width - 16),
			10], false);
	}

	// Top left screw mount
	translate([0, 0, -(brkt_mounts)])
		cube(size = brkt_mounts);

	// Top right screw mount
	translate([0, (pcb_width - brkt_mounts), -(brkt_mounts)])
		cube(size = brkt_mounts);

	// Bottom left screw mount
	translate([(pcb_length - brkt_mounts), 0, -(brkt_mounts)])
		cube(size = brkt_mounts);

	// Bottom right screw mount
	translate([(pcb_length - brkt_mounts), (pcb_width - brkt_mounts), -(brkt_mounts)])
		cube(size = brkt_mounts);
}

// Corner-rounder module..
module fillet(r, h) {
	translate([r / 2, r / 2, 0])
	difference() {
		cube([r + 0.01, r + 0.01, h], center = true);
		translate([r/2, r/2, 0])
		cylinder(r = r, h = h + 1, center = true);
	}
}

//pcbmockup();
bracket();


