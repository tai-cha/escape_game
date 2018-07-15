class SceneManager {

  private Text text = new Text("このテキストが表示される場合はエラーです。\n作者にお知らせください。");
  private PImage wallpaper, floor;

  private int lettersShowed = 0;

  private char[] letters;
  private int counter = 0;

  private final int DEFAULT_LETTER_SHOW_GAP = 5;
  private int letterShowGap = DEFAULT_LETTER_SHOW_GAP;
  private boolean textDrawing =false;
  static final int LETTERS_PER_ROW = 22;

  private int cursol = 0;

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

  void updateText(String str) {
    getText().setStr(str);
    getText().setVisible(true);
    setTextArray();
  }

  void showTextWindow() {
    stroke(#2361FA);
    fill(#2361FA, 30);
    rect(20, height*14/17, width - 40, height*3/17-20, 8);
  }

  void setTextArray() {
    letterShowGap = DEFAULT_LETTER_SHOW_GAP;
    letters = new char[text.getStr().length()];
    for (int i=0; i<text.getStr().length(); i++) {
      letters[i] = text.getStr().charAt(i);
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

  Text getText() {
    return text;
  }

  void setLetterShowGap(int letterShowGap) {
    this.letterShowGap = letterShowGap;
  }

  boolean isTextDrawing() {
    return textDrawing;
  }

  void showText() {
    if (text.isVisible()) {
      cursol = 0;
      if (lettersShowed == 0) {
        textDrawing = true;
        //        println("textDrawing is turned on");
      }
      for (int i=0; i<lettersShowed; i++) {
        if (letters[i] == '\n') {
          cursol += (22 - cursol % LETTERS_PER_ROW);
        } else {
          text(letters[i], (cursol % LETTERS_PER_ROW + 1) * 30, height * 14 / 17 + (cursol / LETTERS_PER_ROW + 1) * 30);
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
    if (counter >= 2100000000) {
      counter = 0;
    }
  }

  void clearScreen() {
  }
}
