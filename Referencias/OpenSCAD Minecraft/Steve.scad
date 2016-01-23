union(){
	difference() {
		translate([0,0,22]) cube([17.5,17.5,17.5],true);//head
	
		//left eye socket
		translate([-4.3,8,22]) cube([4,2,2],true);
		translate([-5.3,6,22]) cube([2,2,2],true);

		//right eye socket
		translate([4.3,8,22]) cube([4,2,2],true);
		translate([5.3,6,22]) cube([2,2,2],true);
	}

	cube([18,9,27],true);//body

	//right arm
	translate([13,0,0]) cube([9,9,27],true);

	//left arm
	translate([-13,0,0]) cube([9,9,27],true);

	//left leg
	translate([-5,-0.4,-26]) cube([9,9,27],true);

	//right leg
	translate([4.5,0,-26]) cube([9,9,27],true);
}
