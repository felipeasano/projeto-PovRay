// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "shapes3.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 10.0 ,-40.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <40 , 40 ,-40>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <-40.0 , 40.0 , -40.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0 , 60 , 60>
                            right     x*image_width/image_height
                            look_at   <0 , 0 , 0>}
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <40 , 40 , 0>
                            right     x*image_width/image_height
                            look_at   <0 ,0 , 0>}
                            
#declare Camera_teste = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0 ,0 , -10>
                            right     x*image_width/image_height
                            look_at   <0 ,0 , 0>}
camera{Camera_teste}
// sun ---------------------------------------------------------------------
light_source{<-1500,2000,-2500> color White}
/*
// sky -------------------------------------------------------------- 
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog on the ground -------------------------------------------------
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    }

// ground ------------------------------------------------------------
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
      } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//-------------------------------------------------------------------------- */

light_source {
    <4,6,-10>
    White
} 

sky_sphere {
    pigment {
        gradient y
        color_map {
            [0 color White]   
            [1 color Blue]
        }      
        scale 2
        translate <0,1,0>
    }
}

//POKEBOLA
       

#declare red_sphere = union{
    sphere{
        <0, 0, 0> 4
        pigment{Red}
        finish { ambient .4 }
    }    
}    

#declare red_box = union{
    box{
        <-7, -5, -1>, <3, .2, 8>
        pigment{color Red}
        
        finish{ambient .4} 
        
        translate <2, .1, -3.5>
    } 
}

#declare white_sphere = union{
    sphere{
        <0, 0, 0> 4
        pigment{White}
        finish { ambient .4 }
    }
} 

#declare white_box = union{
    box{
        <-7, -.1, -1>, <3, 5, 8>
        pigment{color White}
        
        finish{ambient .4} 
        
        translate <2, 0, -3.5>
    } 
}

#declare black_sphere = union{
    sphere{
        <0, 0, 0> 4
        pigment{Black}
        finish { ambient .4 }
    }
    scale .99
}  

#declare click_botton = union{
   cylinder {  
        <0,0,0>, <0,1,0>, .4    
        
        pigment { White }
        
        finish{ambient .4}  
    }
    rotate<90, 0, 0>
    translate<0, 0, -4.3> 
}

#declare base_botton = difference{
    object{
        cylinder {  
            <0,0,0>, <0,.5,0>, .8    
            
            pigment { White }
            
            finish{ambient .4}  
        }
        rotate<90, 0, 0>
        translate<0, 0, -4>
    }
    object{
       cylinder {  
            <0,0,0>, <0,1,0>, .5    
            
            pigment { White }
            
            finish{ambient .4}  
        }
        rotate<90, 0, 0>
        translate<0, 0, -4.3> 
    }
        
}


#declare botton = union{
    object{base_botton}
    object{click_botton}
}   
 
//Parte vermelha da pokebola
#declare parte_vermelha = difference{
  object{red_sphere}
  object{red_box}
}

 
//Parte vermelha da pokebola oca
#declare parte_vermelha_oca = difference{
  object{parte_vermelha}
  object{
    parte_vermelha
    scale 0.9
  }
}

#declare parte_vermelha_oca_furada = difference{
    object{parte_vermelha_oca}
    object{
        cylinder {  
            <0,0,0>, <0,.5,0>, 1    
            
            pigment { Red }
            
            finish{ambient .4}  
        }
        rotate<90, 0, 0>
        translate<0, 0, -4>
    }   
}


//Parte branca da pokebola
#declare parte_branca = difference{
    object{white_sphere}
    object{white_box}
}

//Parte branca da pokebola oca
#declare parte_branca_oca = difference{
    object{parte_branca}
    object{
        parte_branca
        scale 0.9
    }
}

#declare parte_branca_oca_furada = difference{
    object{parte_branca_oca}
    object{
        object{
            cylinder {  
                <0,0,0>, <0,.5,0>, 1    
                
                pigment { White }
                
                finish{ambient .4}  
            }
            rotate<90, 0, 0>
            translate<0, 0, -4>
        }
    }
}


#declare pokebola = union{

    object{
        parte_vermelha_oca_furada
        translate<0, .1, 0>
    }
    object{black_sphere}
    object{
        parte_branca_oca_furada
        translate<0, -.1, 0>
    }
    object{botton}
}

//______________________________________________________________________________________
// POKECENTER

#declare conjunto_prism = union{
    // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color White } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0,45,0>
           translate<-2.2, -3.00, -2.2>
            
            
     } // end of prism -------------------------------------------------------- 
     
     // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color White } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0, 225,0> 
           translate<2.2, -3.00, 2.2> 
     } // end of prism --------------------------------------------------------
     
      // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color White } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0,300,0> 
           translate<2.2, -3.00, -2.2> 
     } // end of prism --------------------------------------------------------
     
       // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color White } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0,135,0> 
           translate<-2.2, -3.00, 2.2> 
     } // end of prism --------------------------------------------------------

} 

#declare conjunto_prism_red = union{
    // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color Red } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0,45,0>
           translate<-2.2, 0.00, -2.2>
            
            
     } // end of prism -------------------------------------------------------- 
     
     // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color Red } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0, 225,0> 
           translate<2.2, 0.00, 2.2> 
     } // end of prism --------------------------------------------------------
     
      // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color Red } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0,315,0> 
           translate<2.2, 0.00, -2.2> 
     } // end of prism --------------------------------------------------------
     
       // linear prism in y-direction: from .. ,to ..,number of points (first = last)
    prism { 0.00 ,2.00 , 4
           <-1.00, 0.00>, // first point
           < 1.00, 0.00>, 
           < 0.00,-1.50>,
           <-1.00, 0.00>  // last point = first point !!!
    
           texture { pigment{ color Red } 
                     finish { phong 1.0 }
                   } // end of texture
    
           scale <1.00, 3.00, 1.00>
           rotate<0,135,0> 
           translate<-2.2, 0.00, 2.2> 
     } // end of prism --------------------------------------------------------

}
 

#declare white_box_pokecenter = difference{

    box{
        <-2.5, -2.5, -2.5>, <2.5, 2, 2.5>
        pigment{White}
        
        finish{ambient .4}  
    }
    object{conjunto_prism}
}

#declare parte_cima_porta = difference{

    torus { 1.1,0.15 
        texture { pigment{ Red}
                  finish { phong 0.4 }
                } // end of texture
        scale 1 rotate<90,0,0> translate<0,-.75,-2.7>
      } // end of torus  -------------------------------
   
   object{
        white_box
        translate<0, -5.4, 0>
   }
    
}



#declare vidro = union{
    
    box { 
        <-1.00, 0.00, -1.00>,< 0.00, 2.00, -.7>   

        texture { pigment{ color rgb< 0.5, 0.75, 1.0> } // light greenish blue 
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 

        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        
        translate<0, -2.5, 0> 
    } // end of box --------------------------------------
    
    box { 
        <0.00, 0.00, -1.00>,< 1.00, 2.00, -.7>   

        texture { pigment{ color rgb< 0.5, 0.75, 1.0> } // light greenish blue 
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0.00}
                 } // end of texture 

        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        
        translate<0, -2.5, 0> 
    } // end of box -------------------------------------- 
    
    cylinder {  
        <0,0,0>, <0,.3,0>, 1    
        
        texture { pigment{ color rgb< 0.5, 0.75, 1.0> } // light greenish blue 
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 reflection 0.00}
         } // end of texture
        
        rotate<90, 0, 0>
        translate<0, -.6, -1>   
    }
    
    box { 
        <0.00, -2.240, 0>,< -.1, .290, .5>   

        pigment { Black } 

        scale <1,1,1> rotate<0,0,0> translate<0,0,0>
        
        translate<0, 0, -1.1> 
    } // end of box --------------------------------------
    
    
    translate<0, 0, -1.8>
        

}
        

#declare porta = union{
    
    sphere_sweep{
        linear_spline
        4,
        <0, 2, 0>, .2
        <0, 0, 0>, .2
        <2, 0, 0>, .2
        <2, 2, 0>, .2
        
        pigment{ Red}
        
        translate<-1, -2.4, -2.7>
    } 
    
    object{parte_cima_porta}
    
    object{vidro}
    
}


#declare base_telhado = difference{
     box{
        <-4.5, 1.9, -3><4.5, 2.3, 3>
        
        pigment{ Red }        
    }
    
    
}

#declare meio_telhado = union{
    
    intersection{ //----------------------------------------------------------------
        // linear prism in x-direction: from ... to ..., number of points (first = last)
        prism { -1.00 ,1.00 , 4
                <-1.00, 0.00>, // first point
                < 1.00, 0.00>, 
                < 0.00, 1.50>,
                <-1.00, 0.00>  // last point = first point!!!
                rotate<-90,-90,0> //turns prism in x direction! Don't change this line!  
              } // end of prism --------------------------------------------------------
        
        // linear prism in z-direction: from ,to ,number of points (first = last)
        prism { -1.00 ,1.00 , 4
               <-1.00, 0.00>,  // first point
               < 1.00, 0.00>, 
               < 0.00, 1.50>, 
               <-1.00, 0.00>   // last point = first point!!!!
               rotate<-90,0,0> scale<1,1,-1> //turns prism in z direction!  
              } // end of prism --------------------------------------------------------
        
          texture { pigment{ Red } 
                    finish { phong 0.2}
                  } // end of texture
        
          scale <4.5, 1.00, 3>
          rotate<0,0,0> 
          translate<0.00, 2.3, 0.00> 
    }// ------------------------------------------------------- end of intersection
         
}

#declare base_meio_telhado = difference {
    union{
       object{base_telhado}
    
        object{meio_telhado} 
    }
    
    object{
        conjunto_prism_red
        scale<1.7, 1, 1.1>
    }
}
 
#declare telhado = difference{
    object{base_meio_telhado}
    
    
}

#declare furo_telhado = union{
    box{
        <-3,-2,-1.5><3,1,1.5>
        pigment{ White }
        
        translate<0, 3, 0>
    }
    
    
}

#declare preenchimento_telhado = union{
    box{
       <-3,-1,-1.5><3,-.4,1.5>
        pigment{ White }
        
        translate<0, 3, 0> 
    }
}

#declare telhado_furado = difference{
    object{telhado}
    
    object{furo_telhado}
}


#declare telhado_preenchido = union{
    object{telhado_furado}
    
    object{preenchimento_telhado}
}



#declare arco_cupula = difference{
    cylinder { <0,0,.01>,<0,0,.40>,0.30
         
         pigment{ Red }
         scale <1,1,1> rotate<0,0,0> translate<0,.5,-.2>
    } // end of cylinder  ------------------------------------
    
    object{red_box}

}

#declare cupula = union{
    object{
        arco_cupula
        scale 5    
    }
    
    object{
        vidro
        translate<0, 3.1, 1.8>
    }
}

#declare poke_simble_cortado = difference{
   cylinder {  
        <0,0,0>, <0,.5,0>, 1            
        pigment { color White }
        rotate<90, 0, 0>
         
    }
    
    object{
        white_box
        scale<0, .03, 0>
        translate<0, -.09, 0>
    }
}

#declare poke_simble_furado = difference{
    object{poke_simble_cortado}
    
    cylinder {  
        <0,0,0-.1>, <0,0,1>, .5            
        pigment { White }
        rotate<0, 0, 0>
         
    }
    
}

#declare poke_simble = union{
    object{poke_simble_furado}
    
    object{
       cylinder {  
            <0,0,0>, <0,0,.5>, .3            
            pigment { White }
            rotate<0, 0, 0>
             
        } 
    }
}

#declare pokecenter = union{
   object{
        white_box_pokecenter scale<1.75, 0, 0>
   }
   object{
    porta
    translate<0, 0, .1>
   }
      
   object{telhado_preenchido}
   
   object{cupula}
   
   object{
        poke_simble
        translate<0, -1.5, -5>
        rotate<65, 0, 0>
        scale .7
   } 
}

//________________________________________________________________
//DIGLETT

#declare capsule = union{
    cylinder {  
        <0,0,0>, <0,4,0>, 2    
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture  
        
    }
    
    sphere {
        <0,4,0,>, 2
         texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
   
    } 
}

#declare eye = union{
    object{ Egg 
        texture{ pigment{ Black }
                 normal { bumps 0.5 scale 0.0125}
               } // end of texture
         
        scale <1,1.5,1>*0.9 
        rotate <0,0,0>
        translate< 0, 0, 0>
      } // end of object
      
    sphere{
        <0, 0, 0>, .3
        pigment{ White }
        translate<0, 2, -.4>
    }
}

#declare eyes = union{ 
    
    
    object{eye}
    object{
        eye
        translate<2.6, 0, 0>
    }
 
}

#declare nose = union{
   sphere{
        <0,0,0> 1
         texture { pigment{ color rgb< 1, 0.5, 0.5>*1.4  } // very light red  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture
         scale<0, .5, 0>
         translate<0, 3, -1.5> 
    } 
}         

 
#declare ground = union{
        //---------------------------------------------------------------------
    height_field{ png "Mount1.png" smooth double_illuminate
                  // file types: 
                  // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
                  // [water_level N] // truncate/clip below N (0.0 ... 1.0)
                  translate<-0.5,-0.0,-0.5>
                  scale <10, 0, 10> 
                  texture{ pigment { color rgb <0.82,0.6,0.4>}
                           normal  { bumps 0.75 scale 0.025  }
                         } // end of texture
                  rotate<0, 0,0>
                  translate<0,0,0>
                } // end of height_field ----------------------------------
    //---------------------------------------------------------------------

} 
 
#declare diglett = union{
    object{capsule}
    
    object{
        eyes
        translate<-1.3, 9, -4.6>
        scale .4
    }
    
    object{nose}
    
    
}

#declare diglett_ground = union{
    object{diglett}
    
        //---------------------------------------------------------------------
    height_field{ png "Mount1.png" smooth double_illuminate
                  // file types: 
                  // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
                  // [water_level N] // truncate/clip below N (0.0 ... 1.0)
                  translate<-0.5,-0.0,-0.5>
                  scale <10, 0, 10> 
                  texture{ pigment { color rgb <0.82,0.6,0.4>}
                           normal  { bumps 0.75 scale 0.025  }
                         } // end of texture
                  rotate<0, 0,0>
                  translate<0,0,0>
                } // end of height_field ----------------------------------
    //---------------------------------------------------------------------

}

//________________________________________________________________________________________
//DUGTRIO      
     
      
#declare dugtrio = union{
    object{
        diglett
    }
    object{
        diglett
        translate<3.5, 0, 0>
        rotate<0, 0, -10>
        scale .9
    }
    object{
        diglett
        translate<2, 4, 3.8>
        rotate<0, 0, -10>
    }
    object{
        capsule
        translate<2, 0, 3.8>
        rotate<0, 0, -10>
    }   
}

#declare dugtrio_ground = union{
    object{dugtrio}
    
    height_field{ png "Mount1.png" smooth double_illuminate
                  // file types: 
                  // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
                  // [water_level N] // truncate/clip below N (0.0 ... 1.0)
                  translate<-0.4,-0.0,-0.4>
                  scale <15, 0, 15> 
                  texture{ pigment { color rgb <0.82,0.6,0.4>}
                           normal  { bumps 0.75 scale 0.025  }
                         } // end of texture
                  rotate<0, 0,0>
                  translate<0,0,0>
                } // end of height_field ----------------------------------
    //---------------------------------------------------------------------

}

//__________________________________________________________________________________________
//SUDOWOODO

#declare chifre = union{
    sphere_sweep{
        linear_spline
        3,
        <-1.7, 1.5, 0>, .6
        <0, 0, 0>, .5
        <1.7, 1.5, 0>, .6
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
    }
                     
    cylinder{
        <0, -2, 0><0,0,0> .5
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
    }
}

#declare body = union{
    cylinder {  
        <0,0,0>, <0,10,0>, 2    
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture  
        
    }
    
    sphere {
        <0,10,0,>, 2
         texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
   
    }
    
    sphere {
        <0,0,0,>, 2
         texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
 
    }    
    
    object{
        chifre
        translate<0, 13, 0>
    }
}

#declare arm = union{
    sphere_sweep{
        linear_spline
        2,
        <0, 0, 0>, .5
        <6, 6, 0>, .5
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
    }
     
    sphere_sweep{
        linear_spline
        2,
        <0, 3, 0>, .5
        <3, 0, 0>, .5
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
    }
    
    sphere{
        <0, 0, 0>, 1.3
         texture { pigment{ color rgb< 0.25, 1.0, 0.0> } //  yellowish green
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 

    }
    
    sphere{
        <0, 3, 0>, 1.3
         texture { pigment{ color rgb< 0.25, 1.0, 0.0> } //  yellowish green
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 

    }
    
    sphere{
        <3, 0, 0>, 1.3
         texture { pigment{ color rgb< 0.25, 1.0, 0.0> } //  yellowish green
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 

    }
}


#declare foot = difference{

    object{ Egg 
            texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
            rotate <-90,0,0>
            translate< -1, -3, .7>
            scale 1.5
          } // end of object
    //----------------------------------------------------------------------------
    
    box{
       <-5, -6, -5>,<4, -4.5, 5>
       texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
       } 
    } 
}

#declare leg = union{
   sphere{
        <-1.5, -.8, 0>, 1.2
       texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture
   }
   
   sphere_sweep{
        linear_spline
        2,
        <-1.5, -.8, 0>, .5
        <-1.5, -3.5, 0>, .5
        texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         } // end of texture 
    }
    
    object{foot} 
}

#declare legs = union{
    object{
        leg
    }     
    
    object{
        leg
        translate<3, 0, 0>
    }
}


#declare manchas = union{
    object{ Egg 
        texture { pigment{ color rgb< 1.0, 1.0, 0.0> } //  color Yellow 
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 reflection 0.00}
             } // end of texture  
            rotate <0,0,0>
            translate< 0, 2,-1.5>
            scale<.7, 1.5, 0>
          } // end of object
    //----------------------------------------------------------------------------
    
    object{ Egg 
        texture { pigment{ color rgb< 1.0, 1.0, 0.0> } //  color Yellow 
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 reflection 0.00}
             } // end of texture  
            rotate <0,0,0>
            translate< 1.5, 3,-1.5>
            scale<.7, 1, 0>
          } // end of object
    //----------------------------------------------------------------------------
   
    object{ Egg 
        texture { pigment{ color rgb< 1.0, 1.0, 0.0> } //  color Yellow 
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 reflection 0.00}
             } // end of texture  
            rotate <0,0,0>
            translate< -1.5, 2,-1.5>
            scale<.7, 1.2, 0>
          } // end of object
    //----------------------------------------------------------------------------
   
    object{ Egg 
        texture { pigment{ color rgb< 1.0, 1.0, 0.0> } //  color Yellow 
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 reflection 0.00}
             } // end of texture  
            rotate <0,0,0>
            translate< 1, 0,-1.5>
            scale<.7, 1.4, 0>
          } // end of object
    //----------------------------------------------------------------------------
    
    object{ Egg 
        texture { pigment{ color rgb< 1.0, 1.0, 0.0> } //  color Yellow 
            // normal { bumps 0.5 scale 0.05 }
               finish { phong 1 reflection 0.00}
             } // end of texture  
            rotate <0,0,0>
            translate< -1, -1,-1.5>
            scale<.7, 1.2, 0>
          } // end of object
    //----------------------------------------------------------------------------
   
} 

#declare sudowoodo = union{
    
    
    difference{
        object{body}
    
      // linear prism in x-direction: from ... to ..., number of points (first = last)
        prism { -1.50 ,1.50 , 4
            <-1.00, 0.00>, // first point
            < 1.00, 1>, 
            < -1.00, 1.5>,
            <-1.00, 0.00>  // last point = first point!!!
            rotate<-90,-90,0> //turns prism in x direction! Don't change this line!  
    
          texture { pigment{ color rgb< 0.75, 0.5, 0.30> }// light brown  
        // normal { bumps 0.5 scale 0.05 }
           finish { phong 1 reflection 0.00}
         }
    
           scale <1.00, 1.00, 1.00> * 1
           rotate<0,0,0> 
           translate<0.00, 7.00, -1.00> 
         } // end of prism --------------------------------------------------------
         

    }
    
    object{
        cylinder{
            <0,0,0>, <0, .5, 0>, 1.5
            pigment{Red}
            translate<0, 6.7, 3.5>
            rotate<-30, 0, 0>
        }
    }
    
    object{
        arm
        translate<-7.5, 1, 0>
    }
    
    object{
        arm
        rotate<0, 0, 180>
        translate<7.5, 13, 0>
    }
    
    object{legs}
    
    object{manchas}
    
    object{
        eye
        translate<-2, 30, -6.5>
        scale .3
    }
    
    object{
        eye
        translate<2, 30, -6.5>
        scale .3
    }
    scale .3
}

#declare scene = union{
    object{
        pokecenter
        translate<0, 2.5, 8>
        scale 3
    }
    
    object{
        pokebola
        translate<-15, 5, -20>
        scale .5
    }
    
    object{
        diglett_ground
        translate<0, 0, -20>
        scale .8
    }
    
    object{
        dugtrio_ground
        translate<10, 0, -20>
        scale .8
    }
    
    object{
        sudowoodo
        translate<30, 5, 0>
        scale .7 
        
    }
}

//scene












 















    


 















