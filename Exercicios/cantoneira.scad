$fa=1; 
$fs=0.5;


module prato( length, width, thickness ){
    difference(){
        cube( [ length, width, thickness ] );
        translate([ length / 2 , width / 2 , - 0.5 ]){
            #cylinder ( r =  length / 10 , h = thickness +1 );
        }
    }
} 

module cantoneira ( length, width, thickness ){
    prato( length, width, thickness );
    rotate ( a = 90 , v = [ 1 , 0 , 0 ]){
        prato( length, width + thickness , thickness );
    }
}
cantoneira( 5 , 5 , 1);