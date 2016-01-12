$fa=1;
$fs=0.5;


module engrenagem( co_radius, co_high ){
    difference(){
        union(){
            cylinder( r = co_radius , h = co_high , center = true );
            for( r = [0 : 5]){
                rotate([ 0 , 0 , r * 360 / 5 ]){
                    translate([ co_radius , 0 , 0 ]){
                        cube ([10, 10 , co_high ], center = true);
                    }
                }
            }
        }
        
        union(){
             for( r = [0 : 4]){
                rotate([ 0 , 0 , r * 360 / 4 ]){
                    translate([ co_radius / 2 , 0 , 0 ]){
                        cylinder ( r = 6, h = co_high * 1.1 , center = true);
                    }
                }
            }
        } 
    }
}


engrenagem( 50, 30 );