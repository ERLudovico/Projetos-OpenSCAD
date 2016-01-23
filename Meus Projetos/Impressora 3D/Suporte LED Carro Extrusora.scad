////////////////////  VARIAVEIS //////////////////////////
include <CameraRPI.scad>;

$fa = 1.5;
$fs = 0.5;

FC = 0.985;

/// Peca do tamanho da extrusora
extLar = 62  ; //61.4 * FC ;
extProfun = 22.5 ;  //21.75 * FC ;
extAlt = 12 * FC ;
// Peca a ser feita
pecaLar = 69.4 * FC ;
pecaProfun = 28.75 * FC ;
pecaAlt = 16 * FC ;

////////////////////  MODULOS //////////////////////////
module pecaPrincipal(){
    // Peca a ser feita
    difference(){    
        difference(){
            // Peca a ser feita
            translate([ - (pecaLar / 2) , - ( pecaProfun / 2 ) , - (pecaAlt - extAlt ) ]){
               cube ([ pecaLar , pecaProfun , pecaAlt ]);
            }
            //Extrusora
            translate([ - (extLar / 2) , - ( extProfun / 2 ) , 0 ]){
               cube ([ extLar , extProfun , extAlt ]);
            }
        
        }
        // Corte Chanfrado
        rotate ([ 5 , 0 , 0 ]) {
            translate([ - ( ( pecaLar + 10 ) / 2) , - ( ( pecaProfun + 10 )/ 2 ) , - 18.3 ]){
               cube ([ ( pecaLar + 10 ) , ( pecaProfun + 10 ) , pecaAlt ]);
            }
        }
            // Corte do prafuso
            translate([  0, 0, 10 ]){
               rotate ([ 90 , 0, 0 ]) cylinder ( r = 7 , h = 100 , center = true);
            }
            
    }
}

////////////////////  RENDERIZACAO //////////////////////////

pecaPrincipal();