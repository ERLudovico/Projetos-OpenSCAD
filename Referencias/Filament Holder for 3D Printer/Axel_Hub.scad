// Axel_Hub.scad
//
// Filiment Holder Axel Hub Layout in the -Y direction at X=0, Z=0
//
//
// fillet_xyz generates a fillet
//    X mm wide, 
//    Y mm long, 
//    Z mmk high 

//
module fillet_xyz(x,y,z)  
{
//   hyp is the hypotenuse (diagonal) of the subtracting cube
      hyp=sqrt((y+2)*(y+2) + (z+2)*(z+2));
      ang = atan2(z,y);
      angshift = atan2(z+2,y+2);
   intersection ()    
   {
      cube(size=[x,y,z], center=true);

      rotate ([90-ang,0,0]) 
         translate ([0, -0.5*(hyp)*cos(angshift), 0]) {
            cube(size=[x+2,y+2,hyp], center=true);
        }
    }
}
//
module cup() {
       translate ([10, -7,13]) 
           rotate ([0,90,90])
           {
               fillet_xyz(26,9,9);
            }
       translate ([10, 7,13]) 
           rotate ([0,90,180])
           {
               fillet_xyz(26,9,9);
            }

      difference ()    {
         rotate ([0,0,0])
            translate ([0, 0, 13]) {
            cylinder (h=26, r=15, $fa=2, center = true);
            }
         rotate ([0,0,0])
            translate ([0, 0, 16]) {
            cylinder (h=26, r1=10.75, r2=11.25, $fa=2, center = true);
            }
        }
    }
module axel() {
      difference () {
           union() {
                  translate ([0, 0, 36]) {
                     cylinder (h=100, r=15, $fa=2, center = true);
                  }
/*                  translate ([0, 0, 84]) {
                     cylinder (h=4, r=16, $fa=2, center = true);
                  }
*/
                  translate ([0, 0, 0]) {
                     cylinder (h=30, r=18, $fa=2, center = true);
                  }
//      base plate
                  translate ([0, 0, -14]) {
                     cylinder (h=4, r=38.5, $fa=2, center = true);
                  }
             }
                translate ([0, 0, 36]) {
                   cylinder (h=106, r=11.5, $fa=2, center = true);
                }
        }
    }
module spoke_holder() {
   translate ([ 0, 0, 16]) {
         union () {
            axel();
            translate ([12, 0, 0]) 
               rotate ([0,90,0])
              {
                  cup();
               }
            translate ([-12, 0,0]) 
               rotate ([180,90,0])
              {
                  cup();
               }
            translate ([0, 12, 0]) 
               rotate ([-90,90,0])
              {
                  cup();
               }
            translate ([0, -12, 0]) 
               rotate ([90,90,0])
              {
                  cup();
               }

             }
         }
     } 


//cup();
spoke_holder();