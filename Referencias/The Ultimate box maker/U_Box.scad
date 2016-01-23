/*******************************************************
*
*
*     FB Aka HeartyGFX 2016
*     http://heartygfx.blogspot.com
*     OpenScad Parametric Box
*
*
********************************************************/


////////////////// - Paramètres de la boite - Box parameters - //////////////////////

//Panneau arrière - Back panel  
BPanel=1;// [0:No, 1:Yes]
//Panneau avant - Front panel
FPanel=1;// [0:No, 1:Yes]
//demi Coque - Half shell
BShell=1;// [0:No, 1:Yes]
//Coque haut - Top shell
TShell=1;// [0:No, 1:Yes]
//Texte façade - Front text
Text=1;// [0:No, 1:Yes]
// - Text you want
  txt = "HeartyGFX";           
// - Font size  
  TxtSize = 3;                 
// - Font  
  Police="Arial Black"; 
// - Longueur - Length  
  Length = 80;       
// - Largeur - Width
  Width = 60;                     
// - Hauteur - Height  
  Height = 30;                                       
// - Diamètre Coin arrondi - Round corner diameter  
  Round = 2;//[0.1:12] 
// - lissage de l'arrondi - Round smoothness  
  Resolution = 50;//[1:100] 
// - Epaisseur - Thickness  
  Thick = 2;//[1:5]
// - Marge - Marging
  m = 0.5;
  
/* [Hidden] */
// - Couleur coque - Shell color  
  Couleur1 = "Orange";       
// - Couleur panneaux - Panels color    
  Couleur2 = "OrangeRed";    



/////////// - Boitier générique bord arrondis - Generic rounded box - //////////

module RoundBox($a=Length, $b=Width, $c=Height){// Cube bords arrondis
                    $fn=Resolution;            
                    translate([0,Round,Round]){  
                    minkowski (){                                              
                        cube ([$a-(Length/2),$b-(2*Round),$c-(2*Round)], center = false);
                        rotate([0,90,0]){    
                        cylinder(r=Round,h=Length/2, center = false);
                            } 
                        }
                    }
                }// End of RoundBox Module

      
////////////////////////////////// - Module Coque/Shell - //////////////////////////////////         

module Coque(){//Coque - Shell  
    Thick = Thick*2;  
    difference(){    
        difference(){//sides decoration
            union(){    
                     difference() {//soustraction de la forme centrale - Substraction rounded box
                      
                        difference(){//soustraction cube median - Median cube slicer
                            union() {//union               
                            difference(){//Coque    
                                RoundBox();
                                translate([Thick/2,Thick/2,Thick/2]){     
                                        RoundBox($a=Length-Thick, $b=Width-Thick, $c=Height-Thick);
                                        }
                                        }//Fin diff Coque                            
                                difference(){//largeur Rails        
                                     translate([Thick+m,Thick/2,Thick/2]){// Rails
                                          RoundBox($a=Length-((2*Thick)+(2*m)), $b=Width-Thick, $c=Height-(Thick*2));
                                                          }//fin Rails
                                     translate([((Thick+m/2)*1.55),Thick/2,Thick/2]){
                                          RoundBox($a=Length-((Thick*3)+2*m), $b=Width-Thick, $c=Height-Thick);
                                                    }           
                                                }//Fin largeur Rails
                                    }//Fin union                                   
                               translate([-Thick,-Thick,Height/2]){// Cube à soustraire
                                    cube ([Length+100, Width+100, Height], center=false);
                                            }                                            
                                      }//fin soustraction cube median - End Median cube slicer
                               translate([-Thick/2,Thick,Thick]){// Forme de soustraction centrale 
                                    RoundBox($a=Length+Thick, $b=Width-Thick*2, $c=Height-Thick);       
                                    }                          
                                }                                          


                difference(){// Fixation box legs
                    union(){
                        translate([3.9*Thick,Thick,Height/2]){
                            rotate([90,0,0]){
                                    $fn=6;
                                    cylinder(d=16,Thick/2);
                                    }   
                            }
                            
                       translate([Length-3.9*Thick,Thick,Height/2]){
                            rotate([90,0,0]){
                                    $fn=6;
                                    cylinder(d=16,Thick/2);
                                    }   
                            }

                        }
                            translate([4,Thick+Round,Height/2-57]){   
                             rotate([45,0,0]){
                                   cube([Length,40,40]);    
                                  }
                           }
                           translate([0,-(Thick*1.46),Height/2]){
                                cube([Length,Thick*2,10]);
                           }
                    } //Fin fixation box legs
            }

        union(){// outbox sides decorations
            for(i=[0:Thick:Length/4]){

                translate([(Length-10) - i,-Thick+0.6,0]){
                    cube([3,Thick,Height/4]);
                    }
                    
                translate([10+i,-Thick+0.6,0]){
                    cube([3,Thick,Height/4]);
                    }    
                    
                translate([10+i,Width-0.6,0]){
                    cube([3,Thick,Height/4]);
                    } 
                    
                translate([(Length-10) - i,Width-0.6,0]){
                    cube([3,Thick,Height/4]);
                    }    
                
                    }// fin de for
                }//fin union decoration
            }//fin difference decoration


            union(){ //sides holes
                $fn=50;
                translate([2.6*Thick+5,20,Height/2+4]){
                    rotate([90,0,0]){
                    cylinder(d=2,20);
                    }
                }
                translate([Length-(3.9*Thick),20,Height/2+4]){
                    rotate([90,0,0]){
                    cylinder(d=2,20);
                    }
                }
                translate([2.6*Thick+5,Width+5,Height/2-4]){
                    rotate([90,0,0]){
                    cylinder(d=2,20);
                    }
                }
                translate([Length-(3.9*Thick),Width+5,Height/2-4]){
                    rotate([90,0,0]){
                    cylinder(d=2,20);
                    }
                }
            }//fin de sides holes

        }//fin de difference holes
}// fin coque 

////////////////////////////// - Experiment - ///////////////////////////////////////////
          


///////////////////////////////// - Module Front/Back Panels - //////////////////////////
                            
module Panels(){//Panels
    color(Couleur2){
        translate([Thick+m,m/2,m/2]){
             difference(){
                  translate([0,Thick,Thick]){ 
                     RoundBox(Length,Width-((Thick*2)+m),Height-((Thick*2)+m));}
                  translate([Thick,-5,0]){
                     cube([Length,Width+10,Height]);}
                     }
                }
         }
}


///////////////////////////////////// - Main - ///////////////////////////////////////
if(BPanel==1)
//Back Panel
translate ([-m/2,0,0]){
Panels();
}
if(FPanel==1)
//Front Panel
rotate([0,0,180]){
    translate([-Length-m/2,-Width,0]){             
     Panels();
       }
   }

if(Text==1)
// Front text
color(Couleur1){     
     translate([Length-(Thick),Thick*4,(Height-(Thick*4+(TxtSize/2)))]){// x,y,z
          rotate([90,0,90]){
              linear_extrude(height = 0.25){
              text(txt, font = Police, size = TxtSize,  valign ="center", halign ="left");
                        }
                 }
         }
}


if(BShell==1)
// Coque bas - Bottom shell
color(Couleur1){ 
Coque();
}


if(TShell==1)
// Coque haut - Top Shell
color( Couleur1,1){
    translate([0,Width,Height+0.2]){
        rotate([0,180,180]){
                Coque();
                }
        }
}
