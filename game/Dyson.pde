class Dyson {
  PVector position = new PVector(2 * movement, movement) ;
  boolean dyson ;

  void dyson() {
    if (current.x == movement && current.y == movement && key == ENTER)
      dyson = true ;
    if (dyson == true && current.x == width && current.y == movement) {
      end = true ;
      clear = true ;
    }
  }

  void draw() {
    if (dyson == false) image(dyson_img, position.x, position.y, movement, movement) ;
    dyson() ;
  }
}

