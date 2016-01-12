// spoke_clamp.scad
//
// Filiment Holder Spoke Clamp Layout in the Z direction centered at X=0, Y=0
//
//
// Fillet generates a fillet
//    X mm wide, 
//    Y mm long, 
//    Z height determined by the angle (deg) with the x-y plane
//
//   Note: ang is limited to a 0 - 90 degree range
//
module fillet(x,y,ang)  
{
//   hyp is the hypotenuse (diagonal) of the subtracting cube
      hyp=sqrt((y+2)*(y+2) + (y+2)*(y+2)*tan(ang)*tan(ang));
   intersection ()    
   {
      cube(size=[x,y,y*tan(ang)], center=true);

      rotate ([90-ang,0,0]) 
         translate ([0, -0.5*(hyp)*cos(ang), 0]) {
            cube(size=[x+2,y+2,(hyp)], center=true);
        }
    }
}
module cup() {
      difference ()    {
         rotate ([0,0,0])
            translate ([0, 0, 11]) {
            cylinder (h=34, r=15, $fa=10, center = true);
            }
//   remove the PVC cup
         rotate ([0,0,0])
            translate ([0, 0, 15]) {
            cylinder (h=28, r1=10.75, r2=11.25, $fa=10, center = true);
            }
//    remove the piece sticking into the clamp
         rotate ([0,90,0])
            translate ([11, 0, 0]) {
            cylinder (h=30, r=14, $fa=10, center = true);
            }
        }
    }
module split_ring() {
   translate ([0, 0, 0]) {
      difference () {
         cylinder (h=40, r=15, $fa=10, center = true);
            union() {
                  translate ([0, 10, 0]) {
                     cube (size = [5, 20, 66], center = true);
                  }
                   translate ([0, 0, 10]) {
                      cylinder (h=66, r=11, $fa=10, center = true);
                   }
             }
        }
    }
 }
module screw_nut() {
         translate ([0, 0, 0]) 
            rotate ([0,90,0]) {
               union() {
                  cylinder (h=40, r=2.8, $fa=10, center = true);
                  translate ([0,0,10]) 
                     rotate ([0,0,30]) {
                        cylinder (h=8, r=4.5, $fa=60, center = true);
                     } 
               }
            }
        }
module clamp() {
   difference () {
      intersection () {
         union() {
            translate ([5, 20, 0]) {
               cube (size = [5, 20, 40], center = true);
               }
            translate ([-5, 20, 0]) {
               cube (size = [5, 20, 40], center = true);
               }
         }
         translate ([0, 11, 0]) 
            rotate ([0,90,0]) {
               cylinder (h=40, r=20, $fa=10, center = true);
         } 
      }
      translate ([-1, 19, 0]) {
         screw_nut ();
      }
   }
}
module spoke_clamp() {
         translate ([0, 0, 38]) 
            rotate ([90,0,0]) {
               union() {
                  translate ([-16,-25, 0]) 
                     rotate ([180,90,0]) {
                        fillet (14,25,18);
                     }
                  translate ([16,-25, 0]) 
                     rotate ([180,-90,0]) {
                        fillet (14,25,18);
                     }
                  translate ([0,-10, 0]) 
                     rotate ([90,0,0]) {
                        cup();
                     }
                  translate ([0, 0, 0]) 
                     rotate ([0,90,0]) {
                        split_ring();
                     }
                  translate ([0, 2, 0]) 
                     rotate ([0,90,0]) {
                        clamp();
                     }
                }
            }
   }
spoke_clamp();
//cup();
//fillet();