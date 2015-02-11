final char WALLC  = '@';
final char PSGC   = '.';
final char STARTC = 'S';
final char GOALC  = 'G';

int[][] cell;
final int WALL  = 0;
final int PSG   = 1;

int sx = -1;
int sy = -1;
int gx = -1;
int gy = -1;

boolean legal = true;

float cell_width ;
float cell_height ;
int x ;
int y ;
boolean flag ;
int direction = 40 ;
boolean[][] track ;
boolean[][] track2 ;

void setup() {
  size(500, 500);
  frameRate(60) ;
  smooth() ;
  flag = false ;
  textAlign(CENTER, CENTER) ;
  textSize(30) ;
  String[] input = loadStrings("maze.txt");
  if (input == null) {
    legal = false;
    return;
  } 
  else {
    cell = new int[input.length][];
    track = new boolean[input.length][];
    track2 = new boolean[input.length][];
    cell_width = width/cell.length ;
    for (int i = 0; i < cell.length; i++) {
      cell[i] = new int[input[i].length()];
      track[i] = new boolean[input[i].length()];
      track2[i] = new boolean[input[i].length()];
      cell_height = height/cell[i].length ;
    }
  }

  for (int i = 0; i < cell.length; i++) {
    for (int j = 0; j < cell[i].length; j++) {
      char c = input[i].charAt(j);
      switch(c) {
      case STARTC:
        if (sx >= 0) {
          legal = false;
        } 
        else {
          sx = j;
          sy = i;
          cell[i][j] = PSG;
        }
        break;
      case GOALC:
        if (gx >= 0) {
          legal = false;
        } 
        else {
          gx = j;
          gy = i;
          cell[i][j] = PSG;
          track[i][j] = true;
          track2[i][j] = true;
        }
        break;
      case PSGC:
        cell[i][j] = PSG;
        track[i][j] = true;
        track2[i][j] = true;
        break;
      case WALLC:
        cell[i][j] = WALL;
        break;
      default:
        legal = false;
        break;
      }
    }
  }
  x = sx ;
  y = sy ;
  if (sx < 0 || gx < 0) {
    legal = false;
  }
}

void draw() {
  if (!legal) {
    return;
  } 
  else if (flag) {
    background(0) ;
    fill(255) ;
    text("Congratulations!", width/2, height/2) ;
  } 
  else {
    for (int i=0; i<cell.length; i++) {
      for (int j=0; j<cell[i].length; j++) {
        if (cell[j][i] == WALL) fill(255, 127, 64) ;
        else if (track[j][i]) fill(255, 255, 191) ;
        else fill(255, 0, 0) ;
        rect(cell_width*i, cell_height*j, cell_width, cell_height) ;
        fill(0) ;
        text("S", (sx+0.5)*cell_height, (sy+0.5)*cell_width) ;
        text("G", (gx+0.5)*cell_height, (gy+0.5)*cell_width) ;
      }
    }
    pushMatrix() ;
    translate((x+0.5)*cell_width, (y+0.5)*cell_height) ;
    rotate(set_radian()) ;
    triangle(0, cell_width/2, -0.7*cell_width/2, -0.9*cell_height/2, 0.7*cell_width/2, -0.9*cell_height/2) ;
    popMatrix() ;
    righthand_method() ;
    if (x == gx && y ==gy) flag = true ;
  }
}

void righthand_method() {
  if (front_wall()) {
    y += y_modify() ;
    x += x_modify() ;
    track[y][x] = false ;
    if (direction == 40) direction -= 3 ;
    else direction += 1 ;
  }
  else {
    if (direction != 37) direction -= 1 ;
    else direction += 3 ;
  }
}

boolean front_wall() {
  boolean wall = true ;
  if (cell[y+y_modify()][x+x_modify()] == WALL) wall = false ;
  return wall ;
}

int x_modify() {
  int s = 0 ;
  switch(direction) {
  case 37: 
    s = -1 ; 
    break ;
  case 38: 
    s = 0 ; 
    break ;
  case 39: 
    s = 1 ; 
    break ;
  case 40: 
    s = 0 ; 
    break ;
  } 
  return s ;
}
int y_modify() {
  int t = 0 ;
  switch(direction) {
  case 37: 
    t = 0 ; 
    break ;
  case 38: 
    t = -1 ; 
    break ;
  case 39: 
    t = 0 ; 
    break ;
  case 40: 
    t = 1 ; 
    break ;
  } 
  return t ;
}

float set_radian() {
  int r = 0 ;
  switch(direction) {
  case 37: 
    r = 90 ; 
    break ;
  case 38: 
    r = 180 ; 
    break ;
  case 39: 
    r = 270 ; 
    break ;
  case 40: 
    r = 0 ; 
    break ;
  }
  return radians(r) ;
}

void keyPressed() {
  if (key == 'a') noLoop() ;
  if (flag) {
    if (key == CODED) {
      flag = false ;
      x = sx ;
      y = sy ;
      for (int i=0; i<track.length; i++) {
        for (int j=0; j<track[i].length; j++) 
          track[j][i] = track2[j][i] ;
      }
    }
  }
}

//void keyPressed() {
//  println(keyCode) ;
//  if (flag == true) {
//    if (key == CODED) {
//      flag = false ;
//      x = sx ;
//      y = sy ;
//    }
//  } else {
//    if (key == CODED) {
//      switch (keyCode) {
//      case LEFT :
//        {
//          if (cell[y][x-1] == PSG) x -= 1 ;
//          break ;
//        }
//      case RIGHT :
//        {
//          if (cell[y][x+1] == PSG) x += 1 ;
//          break ;
//        }
//      case UP :
//        {
//          if (cell[y-1][x] == PSG) y -= 1 ;
//          break ;
//        }
//      case DOWN :
//        {
//          if (cell[y+1][x] == PSG) y += 1 ;
//          break ;
//        }
//      }
//    }
//    if (x == gx && y ==gy) flag = true ;
//  }
//  redraw() ;
//}

