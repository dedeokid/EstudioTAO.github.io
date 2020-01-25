// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 14-16: Simple solar system

// Angle of rotation around sun and planets

//Modified by Marcos André Penna Coutinho
//planetary shapes

/* @pjs preload="Sol.svg",preload="Uranus.svg",preload="Venus.svg",preload="Terra.svg",preload="Saturn.svg",preload="Lua.svg",preload="Mercurio.svg",preload="Phobos.svg",preload="Deimos.svg",preload="Neptune.svg",preload="Pluto.svg"; */


PShape sol;
PShape mercurio;
PShape venus;

PShape terra;
PShape lua;

PShape marte;
PShape phobos;
PShape deimos;

PShape uranus;
PShape saturn;
PShape neptune;
PShape jupiter;
PShape pluto;

float theta = 0;//rotation of planets

float num;//speed of oscilations

float size=1.5;

//save screen
boolean down=false;

void setup() {
  
   size(980, 980, P3D);  // Specify P3D renderer
  hint(DISABLE_DEPTH_MASK);
 // colorMode(HSB, 255,255,255,255);
  frameRate(60);
  smooth();
  
  sol = loadShape("Sol.svg");
 uranus = loadShape("Uranus.svg");
 terra = loadShape("Terra.svg");
 venus = loadShape("Venus.svg");
 lua = loadShape("Lua.svg");
 saturn = loadShape("Saturn.svg");
 neptune= loadShape("Neptune.svg");
 mercurio= loadShape("Mercurio.svg");
 marte= loadShape("Marte.svg");
 phobos= loadShape("Phobos.svg");
 deimos= loadShape("Deimos.svg");
  jupiter = loadShape("Jupiter.svg");
  pluto = loadShape("Pluto.svg");
  
}

void draw() {
  background(255);
    // Translate to center of window to draw the sun.
  translate(width/2,height/2);
  
   //Sun
    stroke(255,150,0,15);
     fill(255, 150, 0, 15);
  for (int i = -180; i < 180; i+=12) 
  {
    
    float x = sin(radians(i)) * 10;
    float y = cos(radians(i)) * 10;
       
    pushMatrix();
    translate(x, y);
    rotate(radians(-i));
    for(int q = 0; q < 300; q+=5)//expansion of ellipses
    {
      float d = map(q, 0, 300, 40, 0);//size of ellipses
      float a = sin(-i+q+num) * 1;//position and oscilation 
      ellipse(a, q, d, d);
    }
    popMatrix();
  }
  
  
  
  
  stroke(0,0,0,255);
  noFill();
  shape(sol,0,0,20*size,20*size);
  
  ellipse(0,0,38,38);//orbit mercury
  ellipse(0,0,71,71);//venus
    ellipse(0,0,150,150);//orbit terra
      ellipse(0,0,250,250);//orbit mars
        ellipse(0,0,550,550);//orbit jupiter
          ellipse(0,0,900,900);//orbit saturn
            ellipse(0,0,1300,1300);//orbit uranus
              ellipse(0,0,1600,1600);//orbit neptune
               ellipse(0,0,1800,1800);//orbit pluto
  
   // The mercury rotates around the sun
  pushMatrix();
  rotate(theta*175);
  translate(18,0);
     shape(mercurio, 0, 0,6*size,16*size);
  popMatrix();
  
   // The venus rotates around the sun
  pushMatrix();
  rotate(theta*117);
  translate(35,0);
    shape(venus, 0, 0,8*size,16*size);
  popMatrix();
  
  // The earth rotates around the sun
  pushMatrix();
  rotate(theta);
  translate(75,0);
    shape(terra, 0, 0,15*size,15*size);
    ellipse(0,0,30,30);//orbit moon
  // Moon #1 rotates around the earth
  // pushMatrix() is called to save the transformation state before drawing moon #1. 
  // This way we can pop and return to earth before drawing moon #2. 
  // Both moons rotate around the earth (which itself is rotating around the sun).
  pushMatrix(); 
  rotate(-theta*4);
  translate(15,0);
   shape(lua,0,0,6*size,8*size);
  popMatrix();
    
  popMatrix();
 
  // The mars rotates around the sun
  pushMatrix();
  rotate(theta/1.06);
  translate(125,0);
   shape(marte, 0, 0,10*size,18*size);
    ellipse(0,0,35,35);//orbit phobos
     ellipse(0,0,50,50);//orbit deimos
    
  // Phobos #1 rotates around the mars
  
  pushMatrix(); 
  rotate(-theta*4);
  translate(15,0);
  shape(phobos,0,0,6*size,10*size);
  popMatrix();
  
  //Deimos #2 also rotates around the mars
  pushMatrix();
  rotate(theta*2);
  translate(25,0);
  shape(deimos,0,0,6*size,10*size);
  popMatrix();
  
  popMatrix();
  
   // The jupiter rotates around the sun and has 67 moons and 50 non confirmed
  pushMatrix();
  rotate(theta/5);
  translate(275,0);
    shape(jupiter, 0, 0,25*size,50*size);
    ellipse(0,0,60,60);// 3 rings
    ellipse(0,0,65,65);
    ellipse(0,0,70,70);
  popMatrix();
  
  // The saturn rotates around the sun and has 67 moons and 50 non confirmed
  pushMatrix();
  rotate(theta/29);
  translate(450,0);
    shape(saturn, 0, 0,35*size,65*size);
    ellipse(0,0,80,80);// 7 rings
    ellipse(0,0,85,85);
    ellipse(0,0,90,90);
    ellipse(0,0,95,95);
    ellipse(0,0,100,100);
    ellipse(0,0,105,105);
    ellipse(0,0,110,110);
    
  popMatrix();
  
  // The uranus rotates around the sun and has 67 moons and 50 non confirmed
  pushMatrix();
  rotate(theta/84);
  translate(650,0);
    shape(uranus, 0, 0,25*size,55*size);
    ellipse(0,0,60,60);// 13 rings
    ellipse(0,0,65,65);
    ellipse(0,0,70,70);
    ellipse(0,0,75,75);
    ellipse(0,0,80,80);
    ellipse(0,0,85,85);
    ellipse(0,0,90,90);
    ellipse(0,0,95,95);
    ellipse(0,0,100,100);
    ellipse(0,0,105,105);
    ellipse(0,0,110,110);
    ellipse(0,0,115,115);
    ellipse(0,0,120,120);
    
  popMatrix();
  
  // The neptune rotates around the sun and has 67 moons and 50 non confirmed
  pushMatrix();
  rotate(theta/165);
  translate(800,0);
    shape(neptune, 0, 0,25*size,45*size);
    ellipse(0,0,60,60);// 6 rings
    ellipse(0,0,65,65);
    ellipse(0,0,70,70);
    ellipse(0,0,75,75);
    ellipse(0,0,80,80);
    ellipse(0,0,85,85);
        
  popMatrix();
  
  // The neptune rotates around the sun and has 67 moons and 50 non confirmed
  pushMatrix();
  rotate(theta/248);
  translate(900,0);
    shape(pluto, 0, 0,15*size,25*size);
    ellipse(0,0,60,60);// 6 rings
    ellipse(0,0,65,65);
    ellipse(0,0,70,70);
    ellipse(0,0,75,75);
    ellipse(0,0,80,80);
    ellipse(0,0,85,85);
        
  popMatrix();
    
  num += 0.1;
  theta += 0.001;
}