void keyPressed() {
  int x = int(current.x / movement) ;
  int y = int(current.y / movement) ;
  collision() ;
  if (key == CODED) {
    for (int i = 0; i < enemyNumber; i++) enemies[i].randomMove() ;
    for (int i = 0; i < customerNumber; i++) customers[i].randomMove() ;
    if (keyCode == UP) {
      hero_img = loadImage("hero_back.gif") ;
      if (stage[x][y].up) 
        current.y -= movement ;
    }
    if (keyCode == DOWN) {
      hero_img = loadImage("hero_front.gif") ;
      if (stage[x][y].down) 
        current.y += movement ;
    }
    if (keyCode == RIGHT) {
      hero_img = loadImage("hero_right.gif") ;
      if (stage[x][y].right) 
        current.x = current.x + movement ;
    }
    if (keyCode == LEFT) {
      hero_img = loadImage("hero_left.gif") ;
      if (stage[x][y].left) 
        current.x = current.x - movement ;
    }
  }
  stageSetup() ;
  if (key == 'r') {
    start = false ;
    end = false ;
    clear = false ;
    setup() ;
  }
}

