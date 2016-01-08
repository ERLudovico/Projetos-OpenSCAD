//$fn = 1000;
$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm


//sphere(r=10);
//!translate([0,0,2.5]) cube([10, 10, 5], center=true);
//cylinder( r1=10, r2=5, h=10, center=true);

/*translate([0,10,-3]){
	difference() {
		cube([20,20,20], center=true);
		color("blue", 10) {
		 	sphere(14);	
		 } 
	}
}
*/
/*difference()
  {
    cube([20,20,20]); // a 20 mm cube
    translate([10,10,-1]) // move origin
      #cylinder(r=5,h=20+2);
  }*/
scale([2,2,3]){
	!difference(){ 
		intersection() {
			cube([20,20,20], center=true);
		    sphere(14);
		}
		translate([0,0,-10+2]){
			cylinder(r=7,h=20+2);
		}	
	}
}