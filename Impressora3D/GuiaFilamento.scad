// Title

$fa = 1.5;
$fs = 0.5;
tube2();
bico();
adaptadorAngular();
adaptador22();

module tube2(){
	$fn=100;
	difference(){
		intersection(){
			translate([0,0,0])rotate_extrude()translate([63,0,0])circle(r=26);
			translate([0,0,-25])cube ([100,100,60]);
		}
		intersection(){
			translate([0,0,0])rotate_extrude()translate([63,0,0])circle(r=5);
			translate([0,0,-25])cube ([100,100,60]);
		}
	}
}

module bico(){
translate([63,0,0]){
	rotate( [90,0,0]){
		difference(){
			cylinder( r = 26 , r2 = 1, h = 30 );
			#cylinder( r = 5 , h = 32);
			}
		}
	}
}

module adaptadorAngular(){
	translate([-30,63,0]){
		rotate( [0,90,0]){
			cylinder( r = 26 , h = 30 );
			#cylinder( r = 5 , h = 32);
		}
	}
}

module adaptador22(){
	translate([-50,63,0]){
		rotate( [0,90,0]){
			cylinder( r = 22 , h = 30 );
			#cylinder( r = 5 , h = 32);
		}
	}
}
