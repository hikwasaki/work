class Stage {
  boolean up = false ;
  boolean down = false ;
  boolean right = false ;
  boolean left = false ;
}

void stageSetup() {
  stage = new Stage[row + 2][column] ;
  for (int i = 0; i < row + 2; i++) {
    for (int j = 0; j < column; j++) {
      stage[i][j] = new Stage() ;
    }
  }
  //up_setting
  for (int j = 4; j > 1; j--) {
    stage[1][j].up = true ;
    stage[3][j].up = true ;
    stage[5][j].up = true ;
  }
  //down_setting
  for (int j = 1; j < 4; j++) {
    stage[1][j].down = true ;
    stage[3][j].down = true ;
    stage[5][j].down = true ;
  }
  //right_setting
  for (int i = 1; i < 5; i++) stage[i][4].right = true ;
  for (int i = 3; i < 7; i++) stage[i][1].right = true ;
  //left_setting
  for (int i = 5; i > 1; i--) stage[i][4].left = true ;
  for (int i = 7; i > 3; i--) stage[i][1].left = true ;
}

