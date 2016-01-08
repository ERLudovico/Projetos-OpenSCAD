$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

//////////////// RENDER //////////////////////////////
//tube();
//tube2();
// elbowinator(angle=135, bendRadius=33)
//  wall2D(thickness=3)
//    circle(r=8);
tube1();
//////////////// MODULES /////////////////////////////
module tube(){
//	hull() {
		union(){
			difference(){
				rotate_extrude(120) translate ([50,0,0]) circle(10);
				difference(){
					cube([120,120,40], center = true);
					translate([30,30,0]) cube([60,60,40], center = true);	
					}
				rotate_extrude(120) translate ([50,0,0]) circle(8);
				difference(){
					cube([120,120,40], center = true);
					translate([30,30,0]) cube([60,60,40], center = true);	
				}
			}
			difference(){
				translate([50,0,0]) rotate([90,0,0]) cylinder(r=10,h=20);
				translate([50,0,0]) rotate([90,0,0]) cylinder(r=8,h=22);
			}
			difference(){
				translate([0,50,0]) rotate([0,270,0]) cylinder(r=10,h=20);
				translate([0,50,0]) rotate([0,270,0]) cylinder(r=8,h=22);
			}	
		}	
//	}

}

module tube1(){
	$fn=128; 

radius = 4; 
inner_radius = 3.5; 

bend_radius = 40; 

angle_1 = 10; 
angle_2 = 100; 

union() { 
        // lower arm 
        rotate([0, 0, angle_1]) 
                translate([bend_radius + radius, 0.02, 0]) 
                rotate([90, 0, 0]) 
                difference() { 
                        cylinder(r=radius, h=50); 
                        translate([0, 0, -1]) 
                                cylinder(r=inner_radius, h=52); 
                } 
        // upper arm 
        rotate([0, 0, angle_2]) 
                translate([bend_radius + radius, -0.02, 0]) 
                rotate([-90, 0, 0]) 
                difference() { 
                        cylinder(r=radius, h=50); 
                        translate([0, 0, -1]) 
                                cylinder(r=inner_radius, h=52); 
                } 
        // bend 
        difference() { 
                // torus 
                rotate_extrude() 
                        translate([bend_radius + radius, 0, 0]) 
                        circle(r=radius); 

                // torus cutout 
                rotate_extrude() 
                        translate([bend_radius + radius, 0, 0]) 
                        circle(r=inner_radius); 
                // lower cutout 
                rotate([0, 0, angle_1]) 
                        translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), -100, -50]) 
                        cube([100, 100, 100]); 
                // upper cutout 
                rotate([0, 0, angle_2]) 
                        translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), 0, -50]) 
                        cube([100, 100, 100]); 
        } 
}
}


module tube2(){
	$fn=100;

	difference(){
		intersection(){
			!translate([0,0,0])rotate_extrude()translate([33,0,0])circle(r=11);
			translate([0,0,-25])cube ([100,100,50]);
		}

		intersection(){
			translate([0,0,0])rotate_extrude()translate([33,0,0])circle(r=8);
			translate([0,0,-25])cube ([100,100,50]);
		}

	}
}



module wall2D(thickness)
  difference()
  {
    offset(thickness)
      children(0);
    children(0);
  }
 
module elbowinator(angle, bendRadius, clipBounds=1000, convexity=4)
  intersection(convexity=convexity)
  {
    rotate_extrude(convexity=convexity)
      translate([bendRadius,0,0])
        children(0);
    linear_extrude(height=clipBounds, slices=2, center=true)   
      wedge2D(angle, clipBounds);
  }

module wedge2D(angle, r, nSides=3) 
  polygon(points=concat([[0,0]], [for(i=[0:nSides]) r*[cos(i/nSides*angle), sin(i/nSides*angle)]]), convexity=4);