int row = 7 ;
int column = 6 ;
int movement = 0 ;
PVector current ;
PImage stage_img ;
PImage hero_img ;
PImage dyson_img ;
PImage clerk_img ;
PImage customer_img ;
boolean start ;
boolean end ;
boolean clear ;
int enemyNumber = 1 ;
int customerNumber = 1 ;
Enemy[] enemies ;
Customer[] customers ;
Stage[][] stage ;
Dyson dyson ;


void setup() {
  frameRate(30) ;
  fill(255) ;
  stage_img = loadImage("store.gif") ;
  hero_img = loadImage("hero_front.gif") ;
  dyson_img = loadImage("dyson.gif") ;
  clerk_img = loadImage("clerk_front.gif") ;
  customer_img = loadImage("customer_front.gif") ;
  size(stage_img.width, stage_img.height-2) ;
  movement = width / row ;
  current = new PVector(width-movement, movement) ;
  enemies = new Enemy[enemyNumber] ;
  for (int i = 0; i < enemyNumber; i++) enemies[i] = new Enemy(i) ;
  customers = new Customer[customerNumber] ;
  for (int i = 0; i < customerNumber; i++) customers[i] = new Customer(i) ;
  dyson = new Dyson() ;
  stageSetup() ;
  ellipseMode(CORNER) ;
  textSize(50) ;
  noStroke() ;
}

void draw() {
  if (start == false && end == false) {
    background(0, 0, 0, 150) ;
    text("Dyson de Daison", width/2 - 200, height/2 - 20) ;
    if (key == ENTER) start = true ;
  } else if (start == true && end == false) {
    image(stage_img, 0, 0) ;
    image(hero_img, current.x, current.y, movement, movement) ;
    for (int i = 0; i < enemyNumber; i++) enemies[i].draw() ;
    for (int i = 0; i < customerNumber; i++) customers[i].draw() ;
    dyson.draw() ;
  } else if (start == true && end == true && clear == false) {
    mosaic() ;
    text("Game Over", width/2 - 150, height/2 - 20) ;
    if (key == 'r') {
      start = false ;
      end = false ;
      setup() ;
    }
  } else {
    mosaic() ;
    text("Clear", width/2 - 100, height/2 - 20) ;
  }
}

