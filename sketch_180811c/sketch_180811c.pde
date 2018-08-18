int Scene =0;
float posX[];
float posY [];
float distancia=0;
int estado[];
int puntaje=0;
PImage bg;
PImage lg;
PImage punta;
PImage clickaca;



void setup()
{
  size (800,800);
   
posX= new float[100];
posY= new float[100];
 estado = new int[100];
      for (int i=0; i<100; i++)
      {
        posX[i]=random (800);
        posY[i]=random (800);
          estado [i]=1;
      }
}

void draw()
{
  if (Scene ==0){
  GUI();
  } else if (Scene ==1){
  playGame();
  } else if (Scene == 2){
  gameOver();
  }
 
    
    
}
//INPUT

 public void mousePressed(){
     if (Scene==0)
     {
       Scene=1;
     playGame();
     }
     
     if(Scene==1)
     {
     GUI();
     }
 }
void GUI()
{
    clickaca= loadImage("inicio.png");
background (clickaca);
textAlign(CENTER);
fill(#ffffff);
textSize(20);
text("Click para empezar", width/2,height/2, -80);




}

void playGame()
  {

    bg = loadImage("fondo.jpg");
    lg = loadImage("nubes.png");
    punta= loadImage("marcador.png");
    background(bg);
 image(lg, 0, 0);
     image(punta, 10, 660);
 

noStroke();
fill (#E8F3F8);

puntaje=0;

    for( int i=0; i<100; i++)
    { 
      
      posY[i]=posY[i]+7;
      
      if(estado[i]==1)
      {
        rect (posX[i], posY[i],3,20);
      }
      
      else 
      {
      puntaje=puntaje+1;
      
      }
      
    }
    
    for( int i=0; i<100; i++)
    { 
      //matar enemigo
      if (mousePressed==true)
      {
        distancia= dist (mouseX, mouseY,posX[i], posY[i]);
        
        if (distancia <20)
        {
        estado [i]=0;
        }
      }
    }
    
    fill(0);
    text(" total:"+puntaje,160,737);
    
    //código de puntaje
  }

void gameOver(){}