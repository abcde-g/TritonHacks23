PImage img; 
PImage rocket;
PImage debris;
PImage debris2;
PImage debris3;
int smallerX,smallerY=60;
  boolean showPopup=false;
int smallerX2,smallerY2=15;

int numBalls = 500;
float spring = 0.05;
float gravity = 0;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];


  
  


float x;
float y;
float easing = 1;

void setup() {
  size(1500, 1000); 
  noStroke();  
showPopup=false;
 
  img = loadImage("starspace.jpg"); 
  img.resize(1500,1000);
  rocket=loadImage("rocket.png");
  rocket.resize(smallerX,smallerY);
  imageMode(CENTER);
  debris=loadImage("debris.png");
  debris.resize(smallerX2,smallerY2);
  debris2=loadImage("debris2.jpg");
  debris3=loadImage("debris3.jpg");
  debris3.resize(576,324);
  
  
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(0,10), random(0,10), 3, i, balls);

  }
  noStroke();
  fill(255, 204);
  
  textAlign(CENTER, TOP);

  
}

void draw() { 
  background(0);
  
  image(img, 750, 500);
  
  image(rocket,mouseX,mouseY);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  fill(0, 0, 250);
  ellipse(x, y, 0, 0);
  showPopup=false;
  showPopup=false;
for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();
    fill(250,0,0);
    rect(int(ball.getx())-3, int(ball.gety())-3, 1, 1);
  image(debris,int(ball.getx()),int(ball.gety()));
    //println(int(x) + "       " + int(y) + "              " + int(ball.getx()) + "       " + int(ball.gety()));
    //if (int(x) == int(ball.getx())){
    //  print("GAMEOVERGAMEOVERGAMEOVERGAMEOVERGAMEOVERGAMEOVERGAMEOVERGAMEOVERGAMEOVER");
    //}
      if (int(ball.getx())-25 < mouseX  &&
    int(ball.getx())+25 > mouseX &&
    int(ball.gety())-25 < mouseY &&
    50 + int(ball.gety())-25 > mouseY) {
    showPopup=! showPopup;
  }
  else{
    continue;
  }
      
    //println(ball.getx() + "          " + ball.gety());
    
  
    
  }

  
if(showPopup){
   background (0,0,0);
    fill(250, 0, 0); // Red color
    textSize(61);
    text("GAME OVER!\nSpaceship Damaged, Left Click to Restart", width/2, height/2);
    textSize(17);
      textAlign(CENTER,BOTTOM);
      fill(17, 820, 200);
    text("Do you find this game annoying? Well so is the space debris around earth.\n According to NASA, the global Space Surveillance Network's (SSN) sensors were tracking 27,000 pieces of space debris in 2021.\n Due to the fast speeds at which they move, they can cause significant damages to spacecraft.\n Around 23,000 pieces of debris larger than a softball orbit the Earth, at up to 17,500 mph.\n There may be millions of other debris that are too small to be tracked, but can still threaten spacecraft.\n Even paint flecks can damage spacecraft, especially space shuttle windows, due to moving at such high speeds.\n Methods implemented to protect spacecraft and astronauts from space debris include shields on spacecraft, tracking larger pieces of space debris, and protective spacesuits.",width/2,height/2);
    image(debris2,750,830);
    image(debris3,300,120);
    fill(0);
  noLoop();
}
}
void mousePressed(){
  loop();
 setup();
 draw();

}
