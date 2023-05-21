PImage img; 
PImage rocket;
PImage debris;
PImage debris2;
PImage debris3;
int smallerX,smallerY=60;
  boolean showPopup=false;
int smallerX2,smallerY2=30;

int numBalls = 500;
float spring = 0.05;
float gravity = 0;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
int health = 3; 


  
  


float x;
float y;
float easing = 1;


int timerStart = 0;
int offset;

int mill;
int minutes;
int seconds; 
int hundredths;

boolean stopped = false;
boolean continued = false;

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
      if (int(ball.getx())-25 < mouseX  &&
    int(ball.getx())+25 > mouseX &&
    int(ball.gety())-25 < mouseY &&
    50 + int(ball.gety())-25 > mouseY) {
    showPopup=! showPopup;
  }
  else{
    continue;
  }
      

    
  
    
  }
if(!stopped) {
    mill=(millis()-timerStart);
    if(continued) mill += offset;
    
    seconds = mill / 1000;
    minutes = seconds / 60;
    seconds = seconds % 60;
    hundredths = mill / 10 % 100;
  }
  fill(255);
  textSize(50);
  text(nf(minutes,2,0)+":"+nf(seconds,2,0)+":"+nf(hundredths,2,0),100,40);
  
if(showPopup){
   background (0,0,0);
    fill(250, 0, 0); // Red color
    textSize(58);
    text("GAME OVER!  Avoid the space debris. You survived " + seconds + " seconds\nSpaceship Damaged, Left Click to Restart", width/2, height/2);
    textSize(17);
      textAlign(CENTER,BOTTOM);
      fill(17, 820, 200);
    text("Do you find this game frustrating? Well so is the space debris orbiting earth.\n According to NASA, the global Space Surveillance Network's (SSN) sensors were tracking 27,000 pieces of space debris in 2021.\n Due to the fast speeds at which they move, they can cause significant damages to spacecraft.\n Around 23,000 pieces of debris larger than a softball orbit the Earth, at up to 17,500 mph.\n There may be millions of other debris that are too small to be tracked, but can still threaten spacecraft.\n Even paint flecks can damage spacecraft, especially space shuttle windows, due to moving at such high speeds.\n Methods implemented to protect spacecraft and astronauts from space debris include shields on spacecraft, tracking larger pieces of space debris, and protective spacesuits.",width/2,height/2);
    image(debris2,750,830);
    image(debris3,300,120);
    fill(0);
       timerStart = 0;
  noLoop();
}
}
void mousePressed(){
      loop();
      setup();
      draw();
      stopped = false;
      continued = false;
      timerStart = millis();

}
