 float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  
  float eman;
  float angleray; // Used to define the tilt of ray
  
  
  //tetractis
 int xx ;
int yy;
int a =64;
int n=2;

//save image
boolean down=false;

  
  void setup() {
  size(1640, 1024);
  background(0); 
}

void draw() {
 // background(0); 
int a =int(random(1,128));//sorteia o tamanho
int draw = int(random(1,7));  //sorteia o padrão
int  n =int(random(1,8));//sorteia as repetições
 
switch(draw) 
 {    case 1: drawT(xx,yy,a,n);
// sC.rewind();
//  sC.play();
       break;
     case 2:  drawL(xx,yy,a,n);
//      sG.rewind();
//  sG.play();
       break;
     case 3: drawR(xx,yy,a,n);
//      sA2.rewind();
//  sA2.play();
       break;
     case 4: drawBR(xx,yy,a,n);
//      sF.rewind();
//  sF.play();
       break;
       case 5:drawBL(xx,yy,a,n);
//    sA.rewind();
//  sA.play();    
       break;
       case 6:drawBT(xx,yy,a,n);
//       sF.rewind();
//  sF.play();
       break;
 }
 x=width/2;
 y=height;
    //tilt = t;
   // scalar = s / 100.0;
    
 tilt = cos(angle)/30 ;
    angle += 0.01;
    eman+=2;
    angleray=cos(3);
    
     xx =width/2;
 yy=height/2+64;
 
    stroke(255);
    noFill();
           ////desenha retangulo preto para apagar rastros
fill(0,0,0, 3);
rect(0, 0, width*2, height*2);


 pushMatrix();
  translate(x, y);
   rotate(tilt);
   // scale(scalar);
  beginShape();
   
    vertex(0, -1000);
    bezierVertex(250, -1000, 400, -650, 400, -400);
    bezierVertex(400, -150, 250, 0, 0, 0);
    bezierVertex(-250, 0, -400, -150, -400, -400);
    bezierVertex(-400, -650, -250, -1000, 0, -1000);
    
    ellipse(0,-450,450,500);
    
   endShape();
 popMatrix();
    
    translate(x, y-440);   
 if (eman>720) {eman=0;}
      for (int i = 0; i < 72; i++) {
        rotate(angleray);
         rotate(-tilt);
        point(eman, eman);
      }
      
      for (int i = 0; i <36; i++) {
       // rotate(angleray);
           // rotate(tilt);
        point(eman, eman);
       
      } 
 if (down)
   {save("MArgarida.jpg");}
 down=false;
    }
 void mousePressed() 
 {
  down = true;
  }

void drawT(int xx, int yy, int apex, int num){
 
  if (num>0){
    for (int i = 0; i <56; i++) {
       // rotate(angleray);
          //point(eman, eman);
        line(xx+eman,yy+eman*i,xx+eman,yy-eman*i);
        line(xx-eman,yy-eman*i,xx-eman,yy+eman*i);
        
        line(xx-eman*i,yy-eman,xx-eman*i,yy+eman);
        line(xx+eman*i,yy+eman,xx+eman*i,yy-eman);
        
       
      } 
    
  }
} 
void drawL(int xx, int yy, int apex, int num){
  line(xx,yy,xx,yy-apex);
  line(xx -apex, yy -apex, xx , yy -apex);
  if (num>0){
    drawL(xx-apex, yy - apex, apex/2,num -1);
     drawL(xx+apex, yy - apex, apex/2,num -1);
  }
}

void drawR(int xx, int y, int apex, int num){
  line(xx,yy,xx,yy-apex);
  line(xx +apex, yy -apex, xx , yy -apex);
  if (num>0){
    drawR(xx+apex, yy - apex, apex/2,num -1);
     drawR(xx-apex, yy - apex, apex/2,num -1);
  }
}
 void drawBR(int xx, int yy, int apex, int num){
  line(xx,yy,xx,yy+apex);
  line(xx +apex, yy +apex, xx , yy +apex);
  if (num>0){
    drawBR(xx+apex, yy + apex, apex/2,num -1);
     drawBR(xx-apex, yy + apex, apex/2,num -1);
  }
 }
  void drawBL(int xx, int yy, int apex, int num){
  line(xx,yy,xx,yy+apex);
  line(xx -apex, yy +apex, xx , yy +apex);
  if (num>0){
    drawBR(xx+apex, yy + apex, apex/2,num -1);
     drawBR(xx-apex, yy + apex, apex/2,num -1);
  }
 }
 void drawBT(int xx, int yy, int apex, int num){
  line(xx,yy,xx,yy+apex);
  line(xx -apex, yy +apex, xx +apex, yy +apex);
  if (num>0){
    drawBT(xx-apex, yy - apex, apex/2,num -1);
     drawBT(xx+apex, yy - apex, apex/2,num -1);
    
  }
 }