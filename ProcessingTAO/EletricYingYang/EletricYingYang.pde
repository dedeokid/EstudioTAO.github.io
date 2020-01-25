//Eletric Ying Yang By: Marcos André Penna Coutinho
float v=0.1;//variação para  + ou - raio
float v1=-0.1;//variação para  + ou - teta
float r=1;//red
float g=1;//green
float b=1;//blue
float cx=490;//centro x
float cy=490; //centro y
float raio=1; //raio do círculo
float teta=1;//angulo de rotação


void setup() {
 colorMode(HSB, 255);
  background(0);
  size(980, 980);
 frameRate(60000);
}

void draw() {
   strokeWeight(4);
   stroke(1+r,1+g,1+b,70);
   fill(1+b,1+r,1+g,90);
   point(cx,cy);
     
      cy = cy  + raio * (cos(teta));
       cx = cx + raio * (sin(teta));
      
      teta=teta+3.14*v1;
      raio=raio+4.90*v;
      r=r+1*v;
      g=g+2*v;
      b=b+3*v;
   
    if (raio>720)
    {v=-1;
    }
else if (raio<0)
{v=+1;
    }
   if (teta>360)
    {v1=+1;
    }
else if (teta<0)
{v1=-1;
    }
     
    }
   