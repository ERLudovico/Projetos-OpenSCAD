////////////////////////// VARIAVEIS ////////////////////////////////

$fa = 1.5;
$fs = 0.5;

FC = 0.98;

// Placa de circuito impresso
cameraCircuitoLar = 32 * FC ;
cameraCircuitoProfun = 32 * FC ;
cameraCircuitoAlt = 1.65 * FC ;


// Base da Lente
cameraBasevLar = 16 * FC ;
cameraBaseProfun = 16 * FC ;
cameraBaseAlt = 8 * FC ;

// Lente
cameraLenteLar = 16 * FC ;
cameraLenteAlt = 7 * FC ;

//Lente Foco
cameraLenteFocoLar = 11.90 * FC ;
cameraLenteFocoAlt = 5 * FC ;

// Base da Lente
cameraConecLar = 22 * FC ;
cameraConecProfun = 5.5 * FC ;
cameraConecAlt = 2.4 * FC ;

//Furos
cameraCircuitoFuroLar = 1.85 * FC ;

////////////////////////// MODULOS ////////////////////////////////
module placaCCD(){
        // Placa de circuito impresso
    color ("darkgreen"){ 
        cube( [cameraCircuitoProfun, cameraCircuitoLar, cameraCircuitoAlt] , center = true);
    }    // Conector odo flat cable da camera
    color ("white"){
        translate([ ( cameraCircuitoProfun / 2 ) - ( cameraConecProfun / 2 )  , 0 , cameraCircuitoAlt ]){
            cube([cameraConecProfun, cameraConecLar, cameraConecAlt] , center = true );
        }
    }
}



module CCD(){
    translate ( [ -cameraBasevLar / 2 , -cameraBaseProfun / 2 , cameraCircuitoAlt / 2 ] ){ 
        color ("gray")
        cube([cameraBasevLar, cameraBaseProfun, cameraBaseAlt]);
    }
}


module jogoLentes( stl ){
   translate([ 0 , 0 , ( cameraCircuitoAlt / 2 ) + cameraBaseAlt ]){
       color ("gray")
       cylinder( r = cameraLenteLar / 2 , h = cameraLenteAlt );
    }
    translate([ 0 , 0 , ( cameraCircuitoAlt / 2 ) + cameraBaseAlt + cameraLenteAlt]){
        color("gray")
        cylinder( r = cameraLenteFocoLar / 2 , h = cameraLenteFocoAlt );
    }
    translate([ 0 , 0 , ( cameraCircuitoAlt / 2 ) + cameraBaseAlt+ cameraLenteAlt + cameraLenteFocoAlt ]){
       color ("gray")
        if ( stl == "true" ){
            cylinder( r = cameraLenteFocoLar / 2 , h = cameraLenteAlt );
        } else {
            cylinder( r = cameraLenteLar / 2 - 0.5 , h = cameraLenteAlt );
        }
    }    
}


module parafusoBase(){
            // Furos da placa para os parafusos 1
            translate([ ( cameraCircuitoProfun / 2 ) - 1.5 , ( cameraCircuitoLar / 2 ) - 1.5, 0 ]){
               #cylinder( r =  cameraCircuitoFuroLar / 2 , h = cameraCircuitoAlt + 0.25 , center = true);
            }
            // Furos da placa para os parafusos 2
            translate([ ( - cameraCircuitoProfun / 2 ) + 1.5 , ( cameraCircuitoLar / 2 ) - 1.5, 0 ]){
               #cylinder( r =  cameraCircuitoFuroLar / 2 , h = cameraCircuitoAlt + 0.25 , center = true);
            }
            // Furos da placa para os parafusos 3
            translate([ ( - cameraCircuitoProfun / 2 ) + 1.5 , ( - cameraCircuitoLar / 2 ) + 1.5, 0 ]){
               #cylinder( r =  cameraCircuitoFuroLar / 2 , h = cameraCircuitoAlt + 0.25 , center = true);
            }
            // Furos da placa para os parafusos 4
            translate([ ( cameraCircuitoProfun / 2 ) - 1.5 , ( - cameraCircuitoLar / 2 ) + 1.5, 0 ]){
               #cylinder( r =  cameraCircuitoFuroLar / 2 , h = cameraCircuitoAlt + 0.25 , center = true);
            }    
}


module camera( stl ){
    difference(){    
        union(){
            // Placa de circuito impresso
            placaCCD(); 
            // CCD
            CCD();
            // JOGO DE LENTES
            jogoLentes( stl);
        }
            // Retirando os furos para os parafusos
            parafusoBase();
    }
}

////////////////////////// REDERIZACAO ////////////////////////////////
//camera( "true" );
