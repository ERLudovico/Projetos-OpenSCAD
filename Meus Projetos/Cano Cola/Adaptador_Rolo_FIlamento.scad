$fa=1; 
$fs=0.5;


// Margen de correção da Impressora: 0.5%  = Fator de correçao

///////////////////  VARIAVEIS GLOBAIS  //////////
// TUBO
FC = 1.025 ; // Fator de correçao
diametroExternoTubo  = 38 * FC;
diametroInternoTubo  = 20 * FC;
comprimentoTubo     = 50 * FC;

// ABA
diametroExternoAba  = 90 * FC;
diametroInternoAba  = 30 * FC;
comprimentoAba     = 4 * FC;

// PARAFUSOS 
diametroBuracoParafusos = 4 * FC;
diametroCabecaAlen = 6 * FC ;
profundidadeCabAlen = diametroExternoTubo / 2.5 ;


///////////////////  MODULOS ///////////////////////
module tubo(){
    difference (){
         // Externo
        cylinder ( r = diametroExternoTubo / 2 , h = comprimentoTubo , center = true);
        // Interno
        #cylinder ( r = diametroInternoTubo / 2 , h = comprimentoTubo + comprimentoAba + 10 , center = true) ; 
      // Dividindo
        #cube ([0.5,diametroExternoAba + 2,comprimentoTubo + comprimentoAba + 10], center = true);
    }
}


module aba(){
      // Externo
union(){ 
      translate([0,0, ( - comprimentoTubo / 2 - ( comprimentoAba * 2 ) ) ]){
            difference(){
                cylinder ( r = diametroExternoAba / 2 , h = comprimentoAba);
                translate([ 0 , 0 , -1 ]) cylinder ( r = diametroInternoAba / 2 , h = comprimentoAba + 2 );
            }        
        }
     
        translate([0,0, ( - comprimentoTubo / 2 ) - comprimentoAba * 2  ]){
            difference(){
                cylinder ( r = diametroExternoAba / 2 , r2 = 10 , h = comprimentoAba * 4 );
                translate([ 0 , 0 , -1 ]) cylinder ( r = diametroInternoAba / 2 , h = ( comprimentoAba * 4 ) + 2);
            }        
        }
    }
}

module corte(){
    intersection(){ 
        //\teste();
        difference() {
            union(){
                tubo();
                aba();                
            }
            
            #buracoParafusos();
            #cube ([0.5,diametroExternoAba + 2,comprimentoTubo + comprimentoAba + 20], center = true);
        }
     
    }
}

module buracoParafusos(){
    // Buraco 1
    translate( [ diametroExternoTubo / 2 , ( diametroInternoTubo / 2 ) + ( (diametroExternoTubo - diametroInternoTubo ) / 4 )   , comprimentoTubo / 3 ] ){
        rotate( a = 90 , v =  [ 0 , -90 , 0 ] ){
            cylinder ( r = diametroBuracoParafusos / 2 , h = diametroExternoTubo);
            cylinder( r = diametroCabecaAlen / 2 , h = profundidadeCabAlen );
            translate ([ 0 , 0 , diametroExternoTubo - profundidadeCabAlen ]) { cylinder( r = diametroCabecaAlen / 2 , h = diametroExternoTubo / 2.5 , $fn = 6 ); } 
            
        }
    }
    
    // Buraco 2
    translate( [ diametroExternoTubo / 2 , ( diametroInternoTubo / 2 ) + ( (diametroExternoTubo - diametroInternoTubo ) / 4 )   ,  - comprimentoTubo / 4 ] ){
        rotate( a = 90 , v =  [ 0 , -90 , 0 ] ){
            cylinder ( r = diametroBuracoParafusos / 2 , h = diametroExternoTubo);
            cylinder( r = diametroCabecaAlen / 2 , h = profundidadeCabAlen );
            translate ([ 0 , 0 , diametroExternoTubo - profundidadeCabAlen ]) { cylinder( r = diametroCabecaAlen / 2 , h = diametroExternoTubo / 2.5 , $fn = 6 ); } 
            
        }
    }    
    
    // Buraco 3
    translate( [ diametroExternoTubo / 2 , - ( diametroInternoTubo / 2 ) - ( (diametroExternoTubo - diametroInternoTubo ) / 4 )   ,  - comprimentoTubo / 4 ] ){
        rotate( a = 90 , v =  [ 0 , -90 , 0 ] ){
            cylinder ( r = diametroBuracoParafusos / 2 , h = diametroExternoTubo);
            cylinder( r = diametroCabecaAlen / 2 , h = profundidadeCabAlen );
            translate ([ 0 , 0 , diametroExternoTubo - profundidadeCabAlen ]) { cylinder( r = diametroCabecaAlen / 2 , h = diametroExternoTubo / 2.5 , $fn = 6 ); } 
            
        }
    }
    
      // Buraco 4
    translate( [ diametroExternoTubo / 2 , - ( diametroInternoTubo / 2 ) - ( (diametroExternoTubo - diametroInternoTubo ) / 4 )   ,  comprimentoTubo / 3 ] ){
        rotate( a = 90 , v =  [ 0 , -90 , 0 ] ){
            cylinder ( r = diametroBuracoParafusos / 2 , h = diametroExternoTubo);
            cylinder( r = diametroCabecaAlen / 2 , h = profundidadeCabAlen );
            translate ([ 0 , 0 , diametroExternoTubo - profundidadeCabAlen ]) { cylinder( r = diametroCabecaAlen / 2 , h = diametroExternoTubo / 2.5 , $fn = 6 ); } 
            
        }
    }
}



module teste(){
    translate ([0,0,30]){
        cube([100,100,12], center =true );    
    }
}
///////////////////  RENDERIZACAO ///////////////////////

corte();
//teste();