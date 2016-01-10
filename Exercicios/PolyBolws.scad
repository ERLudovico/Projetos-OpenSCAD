//////////////////////////////////////////////////////
// Referencia
// https://youtu.be/kn1aqnHF1RE
////////////// PARAMETERS //////////////////////
// Forma Principal
radius = 16 ;
sides = 5 ;
thickness = 1.5 ;

// Base
baseHeight = 1 ;

// Corpo
bodyHeight = 30 ;
bodyTwist = 60;
bodyFlare = 1.8 ;

// Borda
rimHeight = 1 ;
////////////// MODULES //////////////////////
module polyShape(solid){
    difference(){
        // Shape externo 
        offset ( r = 5 , $fn = 48)
            circle ( r = radius , $fn = sides ) ;
        // shape interno
        if ( solid == "no" ){
            offset ( r = 5 - thickness , $fn = 48)
                circle ( r = radius , $fn = sides ) ;            
        }
    }
}



////////////// RENDER //////////////////////

// Base
linear_extrude ( height = baseHeight)
    polyShape( solid = "yes");

// Corpo
translate([0,0, baseHeight]){
    linear_extrude ( height = bodyHeight , twist = bodyTwist, scale = bodyFlare , slices = 2 * bodyHeight) {
        polyShape( solid = "no");
    }
}

// Borda de Cima
translate([0,0, baseHeight + bodyHeight]){
    rotate (-bodyTwist){
        scale(bodyFlare){
            linear_extrude ( height = rimHeight ) {
                polyShape( solid = "no");
            }
        }
    }
}

