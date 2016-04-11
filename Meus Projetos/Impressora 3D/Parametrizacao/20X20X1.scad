////// VARIAVEIS ///////////////

$fa = 1.5;
$fs = 0.5;


larCuboExt = 30;
proCuboExt = 30;
altCuboExt = 30;
paradeCuboExt = 0.40;

//////// MODULOS ////////////////

//Cubo externo
module CunoExterno(){
   difference(){
    color ("white"){
        paradeCuboExt = paradeCuboExt * 2;
        cube([larCuboExt,proCuboExt,altCuboExt], center=true);
    }
    #cube([(larCuboExt - paradeCuboExt), (proCuboExt - paradeCuboExt),(altCuboExt * 1.1) ], center=true); 
   }
}


////////// REDERIZACAO ////////////

CunoExterno();