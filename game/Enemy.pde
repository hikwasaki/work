class Enemy {
  PVector position = new PVector(3 * movement, 2 * movement ) ;
  int direction ;
  int x = int(position.x / movement) ;
  int y = int(position.y / movement) ;
  int n ;
  PImage clerk = clerk_img ;

  Enemy(int i) {
    position.y += i * movement ;
    n = i ;
  }

  void draw() {
    image(clerk, position.x, position.y, movement, movement) ;
    search() ;
  }

  void randomMove() {
    direction = int(random(4)) ;
    search() ;
    switch(direction) {
    case 0 :
      if (stage[x][y].up)
        position.y -= movement ;
      clerk = loadImage("clerk_back.gif") ;
      break ;
    case 1 : 
      if (stage[x][y].down)
        position.y += movement ;
      clerk = loadImage("clerk_front.gif") ;
      break ;
    case 2 :
      if (stage[x][y].right)
        position.x += movement ;
      clerk = loadImage("clerk_right.gif") ;
      break ;
    case 3 :
      if (stage[x][y].left)
        position.x -= movement ;
      clerk = loadImage("clerk_left.gif") ;
      break ;
    }
    collision() ;
  }

  void search() {
    compare(position.x, position.y) ;
    switch(direction) {
    case 0 :
      compare(position.x, position.y - movement) ;
      break ;
    case 1 : 
      compare(position.x, position.y + movement) ;
      break ;
    case 2 :
      compare(position.x + movement, position.y) ;
      break ;
    case 3 :
      compare(position.x - movement, position.y) ;
      break ;
    }
  }

  void compare(float x, float y) {
    if (x == current.x && y == current.y) end = true ;
  }

  void collision() {
    x = int(position.x / movement) ;
    y = int(position.y / movement) ;
    stage[x][y+1].up = false ;
    stage[x-1][y].right = false ;
    stage[x][y-1].down = false ;
    stage[x+1][y].left = false ;
  }
}

