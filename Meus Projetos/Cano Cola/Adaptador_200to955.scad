//Adaptador 20mm para 9,55mm por 20mm de altura
$fa=1; 
$fs=0.5;

module adaptador(){
    difference (){
        // Raio 10 e Altura 17
        cylinder ( r = 10 , h = 17 , center = true);
        #cylinder ( r = 9.60 / 2 , h = 22 , center = true) ;
    }
}



adaptador();

