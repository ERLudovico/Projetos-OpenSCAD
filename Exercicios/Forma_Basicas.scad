//$fn=30;

co_radius = 5;
co_height = 3;

module complexObject(){
    difference(){
        union(){
            cylinder(r = co_radius, h = co_height, center = true );
            for(r=[0:5]){
                rotate([0,0,r*360/5]){
                   translate([co_radius,0,0]){
                      cube([1,1,co_height], center = true);
                   }
                }
            }
        }
        union(){
            for (r=[0:4]){
                rotate([0,0,r*360/4]){
                    translate([co_radius/2,0,0]){
                        cylinder( r=0.5 , h=co_height*1.1 , center = true, $fn=30);
                    }
                }
            }
        }
    }
}

complexObject();

translate([0,-20,0]){
    $fn = 50;
    sphere(3);
}

translate([0,-10,0]){
    difference(){
        cube([6,6,6], center = true);
        cylinder(h=3,r=3.5);
    }
}

translate([0,10,0]){
    difference(){
        cylinder(h=3,r=3.5);
        cube([6,6,6], center = true);
    }
}

translate([0,20,0]){
    union(){
        cylinder(h=3,r=3.5);
        cube([6,6,6], center = true);
    }
}

translate([0,30,0]){
    intersection(){
        cylinder(h=3,r=3.5);
        cube([6,6,6], center = true);
    }
}

scale([1,1,2]){
    translate([0,40,0]){
        intersection(){
            cylinder(h=3,r=3.5);
            cube([6,6,6], center = true);
        }
    }
}

module plate1( lenght,width,thickness){
    translate([0,50,0]){
        rotate(a=90, v=[1,0,0]){
            difference(){
                cube ([lenght,width,thickness]);
                translate([lenght/2,width/2,0]){
                        cylinder(r=0.5, h=2,$fn=30);
                }
            }
        }
    }
}

plate1(6,6,1);



