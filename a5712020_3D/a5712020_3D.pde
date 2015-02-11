float r=32;
float h=80;
void setup() {
  size(420, 220, OPENGL);
  noStroke();
  smooth();
}

void draw() {
  cameraSet();
  fill(255,255,0);
  head();
  pushMatrix();
  rotateZ(0.35);
  ear();
  rotateZ(-0.7);
  ear();
  popMatrix();
  face();
  body();
  tail();  
}
void tail(){
  fill(230,230,0);
  pushMatrix();
  translate(40,-10,-50);
  rotateZ(-0.3);
  box(50,30,10);
  popMatrix();
  
  pushMatrix();
  translate(30,10,-50);
  rotateZ(-0.3);
  box(20,50,10);
  popMatrix();
  
  pushMatrix();
  translate(20,29,-50);
  rotateZ(-0.3);
  box(30,20,10);
  popMatrix();
  
  fill(153, 76, 0);
  pushMatrix();
  translate(10,40,-50);
  rotateZ(-0.3);
  box(15,35,10.01);
  popMatrix();
}

void body(){
  //main
  pushMatrix();
  translate(0,20,0);
  body_parts(40);
  popMatrix();
  
  //left leg
  pushMatrix();
  translate(-25,80,10);
  rotateY(-0.2);
  rotateX(1.5);
  scale(0.5,1.0,0.3);
  sphere(25);
  popMatrix();
  
  //right leg
  pushMatrix();
  translate(25,80,10);
  rotateY(0.2);
  rotateX(1.5);
  scale(0.5,1.0,0.3);
  sphere(25);
  popMatrix();
  
  //left arm
  pushMatrix();
  translate(-20,35,20);
  rotateZ(-0.3);
  rotateX(0.4);
  scale(0.5,1.0,0.5);
  sphere(25);
  popMatrix();
  
  //right arm
  pushMatrix();
  translate(20,35,20);
  rotateZ(0.3);
  rotateX(0.4);
  scale(0.5,1.0,0.5);
  sphere(25);
  popMatrix();
  
  fill(153, 76, 0);
  pushMatrix();
  translate(0,50,-6);
  scale(1.0, 0.3, 0.8);
  sphere(37);
  popMatrix();
  
  pushMatrix();
  translate(0,30,-6);
  scale(1.0, 0.4, 0.8);
  sphere(37);
  popMatrix();  
}

void head(){
  pushMatrix();
  translate(0, -20, 0);
  scale(1, 0.9, 1);
  for(int i=0; i<80; i++){
    translate(0,-i*0.005,0);
    sphere(40);
  }
  popMatrix();
}

void ear(){
  fill(255,255,0);
  pushMatrix();
  translate(0,-87,5);
  scale(0.5, 1.2, 0.6);
  sphere(23);
  fill(0);
  translate(0,-8,0);
  sphere(20);
  popMatrix();
  
}

void body_parts(float size){
  fill(255,255,0);
  scale(0.9, 0.5, 0.8);
  for(int i=0; i<20; i++){
    translate(0,i*0.5,0);
    sphere(size);
  }
}

void face(){
  fill(0);
  //left eye
  pushMatrix();
  translate(-19,-40,37);
  scale(1,1,0.1);
  sphere(7);
  popMatrix();
  
  //right eye
  pushMatrix();
  translate(19,-40,37);
  scale(1,1,0.1);
  sphere(7);
  popMatrix();
  
  //nose
  pushMatrix();
  translate(0,-30,40);
  scale(1,1,0.5);
  sphere(2);
  popMatrix();
  
  //left c
  fill(255,0,0);
  pushMatrix();
  translate(-18,-17,23);
  scale(1,1,0.8);
  sphere(15);
  popMatrix();
  
  //right c
  pushMatrix();
  translate(18,-17,23);
  scale(1,1,0.8);
  sphere(15);
  popMatrix();
  
  //mouth
  fill(0);
  pushMatrix();
  translate(3.5,-20,40);
  rotateZ(0.3);
  box(8,1.5,1);
  popMatrix();
  
  pushMatrix();
  translate(-3.5,-20,40);
  rotateZ(-0.3);
  box(8,1.5,1);
  popMatrix();
  
  fill(0);
  pushMatrix();
  translate(-9,-20,40);
  rotateZ(0.4);
  box(3.3,1.5,1);
  popMatrix();
  
  pushMatrix();
  translate(9,-20,40);
  rotateZ(-0.4);
  box(3.3,1.5,1);
  popMatrix();
  
//  fill(255,110,0);
//  pushMatrix();
//  translate(0,-10,40);
//  scale(0.6,0.8,0.3);
//  sphere(10);
//  popMatrix();
  
  fill(255);
  //left white eye
  pushMatrix();
  translate(-15.4,-42,38);
  scale(1,1,0.1);
  sphere(3);
  popMatrix();
  
  //right eye
  pushMatrix();
  translate(15.4,-42,38);
  scale(1,1,0.1);
  sphere(3);
  popMatrix();
}
void cameraSet(){
  lights();
  background(255);
  float camZ = (height/2.0) / tan(PI*60.0 / 360.0);
  camera(mouseX, mouseY, camZ,      // Camera location
         width/2.0, height/2.0, 0,  // Camera target
         0, 1, 0);                  // Camera orientation
  translate(width/2, height/2, -20);
  
}
