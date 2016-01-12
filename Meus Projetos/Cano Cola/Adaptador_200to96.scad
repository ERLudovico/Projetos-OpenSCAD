//Adaptador 20mm para 9,60mm por 20mm de altura
$fa=1; 
$fs=0.5;

module adaptador(){
    difference (){
        cylinder ( r = 10 , h = 18 , center = true);
        #cylinder ( r = 9.6 / 2 , h = 22 , center = true) ;
    }
}

adaptador();