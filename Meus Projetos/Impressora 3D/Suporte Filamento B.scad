//////////////////// GLOBAIS ///////////////////

$fa = 1.5;
$fs = 0.5;
FC = 1.025 ;
// Tubo
diametroTuboExterno = 40 * FC ;
diametroTuboInterno = 32 * FC ;
comprimentoTubo = 35 * FC ;
// ABA
diametroAbaExterno = 60 * FC ;
diametroAbaInterno = 38 * FC ;
comprimentoAba = 24 * FC ;

//////////////////// MODULES ///////////////////

module espacador(){
    difference(){
        cylinder( r = diametroTuboExterno / 2 , h = comprimentoTubo );
        // Parte proximo a aba
        translate ([0,0,-1]) #cylinder( r = ( diametroTuboInterno / 2)   , h = ( comprimentoTubo / 2 ) + 2 );
        // Parte proximo ao rolo
        translate ([0,0,15]) #cylinder( r = diametroTuboInterno / 2 + 2, h = ( comprimentoTubo / 2 ) + 10 );    
    }
}

module Aba(){
    union(){
        translate([ 0 , 0 , comprimentoTubo - comprimentoAba ]){
            difference(){
                cylinder( r = diametroAbaExterno / 2 , r2 = diametroTuboExterno / 2,  h = comprimentoAba );            
                translate ([0,0,-1]){ 
                    #cylinder( r = ( diametroAbaInterno / 2) - 2, h = ( comprimentoAba / 2 ) + 20 );
                }
                
            }
        }
        //translate([ 0 , 0 , 0]){
            difference(){
                cylinder( r = (diametroAbaExterno / 2),  h = comprimentoTubo - comprimentoAba  );            
                translate ([0,0,-1]){ 
                    #cylinder( r = ( diametroAbaInterno / 2), h = ( comprimentoAba / 2 ) + 4 );
                }
                
        //    }
        }
        
    }
}

//////////////////// RENDER ///////////////////
// Tubo Externo
espacador();
Aba();
