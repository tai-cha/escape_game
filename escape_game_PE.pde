import processing.sound.*;


int itemMax = 10;
Item[] items;
SceneManager sm;
color bgColor = color(0);


void setup() {
 items = new Item[itemMax];
 sm = new SceneManager();
 size(720,720);
 background(0);
 
}

void draw() {
  background(bgColor);
  sm.showtextWindow();
}
