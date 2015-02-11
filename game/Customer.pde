class Customer {
  PVector position = new PVector(2 * movement, 4 * movement ) ;
  int direction ;
  int x = int(position.x / movement) ;
  int y = int(position.y / movement) ;
  int n ;
  PImage customer = customer_img ;

  Customer(int i) {
    position.x += i * movement ;
    n = i ;
  }

  void draw() {
    image(customer, position.x, position.y, movement, movement) ;
  }

  void randomMove() {
    x = int(position.x / movement) ;
    y = int(position.y / movement) ;
    direction = int(random(4)) ;
    switch(direction) {
    case 0 :
      if (stage[x][y].up)
        position.y -= movement ;
      customer = loadImage("customer_back.gif") ;
      break ;
    case 1 : 
      if (stage[x][y].down)
        position.y += movement ;
      customer = loadImage("customer_front.gif") ;
      break ;
    case 2 :
      if (stage[x][y].right)
        position.x += movement ;
      customer = loadImage("customer_right.gif") ;
      break ;
    case 3 :
      if (stage[x][y].left)
        position.x -= movement ;
      customer = loadImage("customer_left.gif") ;
      break ;
    }
    collision() ;
  }
  
  void collision(){
    x = int(position.x / movement) ;
    y = int(position.y / movement) ;
    stage[x][y+1].up = false ;
    stage[x-1][y].right = false ;
    stage[x][y-1].down = false ;
    stage[x+1][y].left = false ;
  }
}

