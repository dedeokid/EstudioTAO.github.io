//Original sketch by Michael Pinn http://slambeetle.tumblr.com/
//Modified by Marcos André Penna Coutinho

float num;
 
void setup() {
  size(980, 980);
  fill(255, 150, 0, 25);
  noStroke();
}
 
void draw() {
  background(0);
  translate(width/2, height/2);
    
  for (int i = -180; i < 180; i+=12) {
    
    float x = sin(radians(i)) * 20;
    float y = cos(radians(i)) * 20;
     
    pushMatrix();
    translate(x, y);
    rotate(radians(-i));
  
    for(int q = 0; q < 1200; q+=5)//expansion of ellipses
    {
      float d = map(q, 0, 600, 40, 0);//size of ellipses
      float a = sin(-i+q+num) * 4;//position and oscilation 
      ellipse(a, q, d, d);
    }
    popMatrix();
  }
   
  num += 0.1;//speed of oscilations
}