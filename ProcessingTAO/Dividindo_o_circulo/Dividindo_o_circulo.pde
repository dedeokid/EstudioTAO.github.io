//Created by MArcos André Penna Coutinho
// Para se descobrir quais divisores dividem um círculo em partes iguais 
//1,2,3,4,5,6,8,9,10,12,15,18,20,24,30,36,40,45,60,72,90,120,180,360


//as velocidades  de cada um diferem do outro em  velocidades de 0,01 ou 0,02, ou 0,03 ou 0,04 positivos(pra direita) ou negativos( pra esquerda)

float[] distribution = new float[360];

//Variáveis de rotação

float r1 = 0; //rotação para a direita, positivo+


//para desenhar triangulo equilátero derivando do círculo

float nextx;
float nexty;
float radius; 
float angle;
int deg;
float div=1;//divisor do circulo em angulos
 

void setup() {
  size(720, 720);//tamanho em pixels da tela (horizontal,vertical)
  
  rectMode(CENTER);
    colorMode(HSB, 360, 100, 100);
   
}
void draw() {
background(255);
 
 //rigth rotations (direita)  
r1 = r1 + 0.0012;// adição no float de rotação 


noFill();
translate(360, 360);
  rotate(r1);
  beginShape();
  for (deg = 0; deg < 360; deg += div)//vertice pula de div em div
  { radius = 360;
    angle = deg * PI / 180;
    nextx = cos(angle) * radius;
    nexty = sin(angle) * radius;
  
           stroke(deg,100,100);
   fill(deg,100,100,5);//preenchimento(v1,v2,v3,alpha)
   arc(0,0,deg,deg,angle, angle*2);
    line(0,0,nextx, nexty); 
    vertex(nextx, nexty);
       
  }
  endShape(CLOSE);
  resetMatrix();

if (div>361) {div=1;}
else if (div<1) {div=360;}

 translate(360, 360);
ellipse(0,0,512,512); 
println( "lado= 360 /" + div);
println( "numero de lados IGUAIS=" + 360 / div);

}
void mouseWheel(MouseEvent event) {
  div=div+1;
  
}
void mousePressed(MouseEvent event) {
  div=div-1;
  
}