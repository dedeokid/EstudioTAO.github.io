//"Water"
//ByMarcosAndréPennaCoutinho

float deg=0;
float radius=0;
float angle =0;
float nextx = 0;
float  nexty = 0;

float c1 = 100;
float c2 = 1;

float v= 1;
float v1= 1;
float v2= 1;

float a= 1;

class Monada {
  float x;
  float y;
  float t;
  float speed;
   
  Monada(float tx, float ty, float tspeed)
  {
    x = tx;
    y = ty;
    t = 0;
    speed = tspeed;
  }

  void live()
  {
    float sz = map(sin(t), -1,1, 32,64);//size variation,(x,y,?,tamanho min, tamanho max)
   translate(x,y);
   beginShape();
  for (deg = -18; deg < 360; deg += 60)
  { radius = sz;
    angle = deg * PI / 180;
    nextx = cos(angle) * radius;
    nexty = sin(angle) * radius;
    vertex(nextx, nexty);
  }
  endShape(CLOSE);
  resetMatrix();
    
    
    t = t + speed;
  }  
}

Monada[] individuos = new Monada[700];

void setup() 
{
  size(displayWidth,displayHeight);
    smooth();
  colorMode(HSB, 100); 
 rectMode(CENTER); 
   
  for(int i=0; i<individuos.length; i++)
  {
    float x = width/2 + cos(i/1.7) * i;
    float y = height/2 + sin(i/1.7) * i;
    individuos[i] = new Monada(x, y, 0.01 + (i/12000.0) );
  }
}
void draw() 
{
   background(0,0,0,0);
  fill(c1, 60,60,a);
stroke(c2,80,80,a);
 noCursor();
 
 a = a + v;
  c1 = c1 + (noise(1,12)*v1);
  c2 = c2 + (noise(1,12)*v2);

 if (c1 > 100) {   v1 =v* -1;  }
 else if (c1 < 0) {   v1 =v1* -1;  }
  
 if (c2 > 100) {   v2 =v2* -1;  }
 else if (c2 < 0) {   v2 =v2* -1;  }

  if (a > 100) {   v =v* -1;  }
  else if (a < 0) {   v =v* -1;  }
   
  for(int i=0; i<individuos.length; i++) 
{ 
individuos[i].live();}
}