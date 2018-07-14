import processing.sound.*;

PFont hiraKaku;

int itemMax = 10;
Item[] items;
SceneManager sm;
Inventory iv;
color bgColor = color(0);
boolean isStartScreen = true;

void setup() {
  hiraKaku = createFont("HiraKakuPro-W3", 30, true);
  textFont(hiraKaku);
  items = new Item[itemMax];
  sm = new SceneManager();
  iv = new Inventory();
  size(720, 720);
  background(bgColor);
  sm.setWallpaper("wallpaper01.jpg");
  sm.setFloor("floor01.jpg");
  sm.showRoom();
  sm.setText("testです。これはテストです。");
}

void draw() {
  background(bgColor);
  sm.showRoom();
  sm.showTextWindow();
  iv.showBoxes();
  sm.showText();
}

void mousePressed() {
  if (sm.textWindowCheck(mouseX, mouseY)) {
    if (sm.textDrawing) {
      sm.letterShowGap = 2;
      println("show gap changed");
    } else {
      sm.textVisible = false;
      println("text is changed invisible");
    }
  }
}
