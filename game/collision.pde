void collision() {
  int x = int(current.x / movement) ;
  int y = int(current.y / movement) ;
//  println(x +" "+ y) ;
//  for (int i = 0; i < enemyNumber; i++) enemies[i].collision() ;
//  for (int i = 0; i < customerNumber; i++) customers[i].collision() ;
    stage[x][y+1].up = false ;
    stage[x-1][y].right = false ;
    stage[x][y-1].down = false ;
    stage[x+1][y].left = false ;
}
boolean someoneExist(int x, int y) {
  int someone = 0 ;
  if(int(current.x/movement) == x && int(current.y/movement) == y) someone++ ;
  for (int i = 0; i < enemyNumber; i++) 
  if(enemies[i].x == x && enemies[i].y == y) someone++ ;
  for (int i = 0; i < customerNumber; i++)
  if(customers[i].x == x && customers[i].y == y) someone++ ;
  if(someone == 1) return false ;
  return true ;
}
