$fa=1; 
$fs=0.5;

//roudedcubeBYhull(20,20,10,3);
roudedcubeBYoffset(20,20,10,3);

module roudedcubeBYhull(xdim, ydim, zdim, rdim){
    
    hull(){
        translate ([rdim,rdim,0]) cylinder( r = rdim , h = zdim);
        translate ([xdim-rdim,rdim,0]) cylinder( r = rdim , h = zdim);
        translate ([rdim,ydim-rdim,0]) cylinder( r = rdim , h = zdim);
        translate ([xdim-rdim,ydim-rdim,0]) cylinder( r = rdim , h = zdim);
    }
}

module roudedcubeBYoffset(xdim, ydim, zdim, rdim){
    offset ( r = rdim  ){ 
        //cube ( xdim , ydim, zdim ) ;
        //circle ( r = xdim / 2 , h = 20  ); // ,$fn = 4 );    
        cylinder ( r = xdim / 2 , h = zdim , $fn = 4 );
    }
}

// https://www.youtube.com/watch?v=kn1aqnHF1RE
