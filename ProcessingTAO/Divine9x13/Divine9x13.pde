//Divine Petals
//By:MArcos André Penna Coutinho
float a = 0;
float b = 0;
float co = 0;
float co1 = 0;
float co2 = 0;

void setup() {
  background(255);
  colorMode(HSB, 100);
  size(980, 980);
  smooth();
  strokeWeight(2);
  frameRate(60000);
}

void draw() {
  stroke(co, co2+64, co1+128, 12);
  println(frameCount);
  float x0 = map(sin(a), -1, 1, 20, width - 20);
  float y0 = map(cos(a), -1, 1, 20, height - 20);
  
  float x1 = map(sin(b), -1, 1, 20, width - 20);
  float y1 = map(cos(b), -1, 1, 20, height - 20);
    
  line(x0, y0, x1, y1);
  
  a = a +13;//360graus/36=10petalas
  b = b + 9;
  
  co = co + 0.1;
  if (co > 100) {
    co = 0;
  }
   co2 = co2 + 0.1;
  if (co > 100) {
    co = 0;
  }
   co1 = co1 + 0.1;
  if (co > 100) {
    co = 0;
  }
}