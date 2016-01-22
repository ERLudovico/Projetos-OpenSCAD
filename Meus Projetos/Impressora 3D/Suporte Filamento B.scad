//////////////////// GLOBAIS ///////////////////

$fa = 1.5;
$fs = 0.5;
FC = 1.025 ;
// Tubo
diametroTuboExterno = 40 * FC ;
diametroTuboInterno = 35 * FC ;
diametroTuboInternoB = 31.5 * FC ;

comprimentoTubo = 35 * FC ;
comprimentoTuboB = 15 * FC ;

// ABA
diametroAbaExterno = 90 * FC ;
diametroAbaInterno = diametroTuboExterno - 2 ;
comprimentoAba = 4 * FC ;

//////////////////// MODULES ///////////////////

module espacador(){
    difference(){
        cylinder( r = diametroTuboExterno / 2 , h = comprimentoTubo );
        // Parte proximo a aba
        translate ([0,0,-1]) #cylinder( r = ( diametroTuboInterno / 2)   , h = ( comprimentoTubo / 2 ) + 2 );
        // Parte proximo ao rolo
        translate ([0,0,comprimentoTuboB]) #cylinder( r = diametroTuboInternoB / 2, h = ( comprimentoTubo / 2 ) + 10 );    
    }
}

module Aba(){
    union(){
        translate([ 0 , 0 , comprimentoTubo - comprimentoAba ]){
            difference(){
                cylinder( r = diametroAbaExterno / 2,  h = comprimentoAba );            
                translate ([0,0,-1]){ 
                    #cylinder( r = ( diametroAbaInterno / 2) , h = ( comprimentoAba / 2 ) + 20 );
                }
                
            }
        }
        translate([ 0 , 0 , 10]){
            difference(){
                cylinder( r = diametroTuboExterno / 2 , r2 = (diametroAbaExterno / 2),  h = comprimentoTubo - comprimentoAba - 9 );            
                translate ([0,0,-1]){ 
                    #cylinder( r = ( diametroAbaInterno / 2), h = ( comprimentoTubo ));
                }
                
            }
        }
        
    }
}

//////////////////// RENDER ///////////////////
// Tubo Externo
espacador();
Aba();
