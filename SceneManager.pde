class SceneManager {

  String text = "テキストがセットされていないよ";
  PImage wallpaper, floor;

  int lettersShowed = 0;
  boolean textVisible = true;

  char[] letters;
  int counter = 0;

  int letterShowGap =5;
  boolean textDrawing =false;
  int textRow = 0;

  int cursol = 0;

  void setWallpaper(String imgPath) {
    wallpaper = loadImage(imgPath);
  }
  void setFloor(String imgPath) {
    floor = loadImage(imgPath);
  }

  void showRoom() {
    image(wallpaper, 0, 0);
    image(floor, 0, width*2/3);
  }

  void startScreen() {
  }

  void showTextWindow() {
    stroke(#2361FA);
    fill(#2361FA, 30);
    rect(20, height*14/17, width - 40, height*3/17-20, 8);
  }

  void setText(String text) {
    letters = new char[text.length()];
    for (int i=0; i<text.length(); i++) {
      letters[i] = text.charAt(i);
    }
    counter = 0;
  }

  boolean textWindowCheck(float x, float y) {
    if (20 < x && x < width-20 && height * 14 / 17 < y && y < height - 20) {
      return true;
    } else {
      return false;
    }
  }

  void showText() {
    if (textVisible) {
      cursol = 0;
      if (lettersShowed == 0) {
        textDrawing = true;
        println("textDrawing is turned on");
      }
      /*      if (letters[lettersShowed] == '\n'){
       textRow++;
       println("row is"+str(textRow));
       } */
      for (int i=0; i<lettersShowed; i++) {
        if (letters[i] == '\n') {
          cursol += (22 - cursol % 22);
        } else {
          text(letters[i], (cursol % 22 + 1) * 30, height * 14 / 17 + (cursol / 22 + 1) * 30);
          cursol++;
        }
      }
      if (lettersShowed<letters.length) {
        if (counter % letterShowGap == 0) {
          lettersShowed++;
        }
      } else {
        textDrawing = false;
        //        println("textDrawing is turned off");
      }
      counter++;
    }
  }

  void clearScreen() {
  }
}
