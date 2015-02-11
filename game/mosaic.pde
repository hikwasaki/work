void mosaic() {
  int mosaicWidth = 5 ;
  int mosaicHeight = 5 ;
  PImage gameOver = get();
  for (int j = 0; j < height; j += mosaicHeight) {
    for (int i = 0; i < width; i += mosaicWidth) {
      fill(pointColor(gameOver, i, j)) ;
      rect(i, j, mosaicWidth, mosaicHeight) ;
    }
  }
}

color pointColor(PImage img, int x, int y) {
  return img.get(x, y) ;
}

