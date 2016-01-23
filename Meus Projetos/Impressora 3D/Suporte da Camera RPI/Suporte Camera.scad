////////////////////  VARIAVEIS //////////////////////////
include <CameraRPI.scad>;

$fa = 1.5;
$fs = 0.5;

FC = 1.025;

/// BASE DA CANERA
baseCameraProfun = 40 * FC ;
baseCameraLar = 40 * FC ;
baseCameraAlt = 4 * FC ;
baseCameraEspessura = 4 * FC ;

////////////////////  MODULOS //////////////////////////
module baseCamera(){

    difference(){
        //Bloco maior
        translate ([ 0 , 0 , -2.5 ]){
            cube([baseCameraProfun,baseCameraLar,baseCameraAlt * 2] , center = true );
        }
        //Bloco menor (cavidade)
        translate ([ 0 , 0 , 0 ]){
            cube([baseCameraProfun - baseCameraEspessura,baseCameraLar - baseCameraEspessura,baseCameraAlt] , center = true );   
         }
    }
}

module suporteCamera(){
    baseCamera();
}


////////////////////  RENDERIZACAO //////////////////////////


%camera("false");
suporteCamera();

echo(version=version());