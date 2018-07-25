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
  private int plantMoveTimes = 0;

  SceneManager() {
    setWallpaper("wallpaper01.jpg");
    setFloor("floor01.jpg");
  }

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
    itemDraw();
    textFont(title);
    fill(#84B45B, 99);
    rect(0, 0, width, height);
    fill(0);
    text("フリ素部屋からの脱出", 10, 240);
    textFont(mplus);
    text("クリックでスタート", 240, 400);
  }

  void updateText(String str) {
    text = new Text(str);
    lettersShowed = 0;
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
    for (int i=0; i<letters.length; i++) {
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
    fill(0);
    textFont(mplus);
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

  void textClicked () {
    if (sm.isTextDrawing()) {
      sm.setLetterShowGap(1);
      println("show gap changed");
    } else {
      sm.getText().setVisible(false);
      println("text is changed invisible");
    }
  }
  
  void drawDirectionChangeButton() {
    fill(#54B1ED,90);
    ellipse(40,height/2,50,50);
    ellipse(width-40,height/2,50,50);
    fill(0);
    noStroke();
    triangle(25,height/2,50,height/2-15,50,height/2+15);
    triangle(width-25,height/2,width-50,height/2-15,width-50,height/2+15);    
}

  int dirButtonClickChecker() {
    if(dist(40,height/2,mouseX,mouseY) <= 25){
      return LEFT;
    }
    if(dist(width-40,height/2,mouseX,mouseY) <= 25){
      return RIGHT;
    }
    return 0;
  }

  void clearScreen() {
    itemDraw();
    textFont(title);
    fill(#84B45B, 99);
    rect(0, 0, width, height);
    fill(0);
    text("ゲームクリアーーーーー！！！！！", 10, 240);
    textFont(mplus);
    text("おめでとう！！！！！！！", 240, 400);
    showTextWindow();
    
    showText();
  }
  
  
void movePlant() {
  if(plantMoveTimes <60){
    items.get("plant").move(-2,0);
    plantMoveTimes++;
  }else{
    plantMoving = false;
    plantMoved = true;
  }
}
  
}
