import processing.sound.*;


int itemMax = 10;
Item[] items;
SceneManager sm;
Inventory iv;
color bgColor = color(0);
boolean isStartScreen = true;


void setup() {
  items = new Item[itemMax];
  sm = new SceneManager();
  iv = new Inventory();
  size(720, 720);
  background(bgColor);
  sm.setWallpaper("wallpaper01.jpg");
  sm.setFloor("floor01.jpg");
  sm.showRoom();
}

void draw() {
  background(bgColor);
  sm.showRoom();
  sm.showTextWindow();
  iv.showBoxes();
  
}
