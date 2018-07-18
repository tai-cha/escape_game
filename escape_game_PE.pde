import processing.sound.*;
import java.util.Map;

PFont hiraKaku;
JSONArray JSONtexts;
Text[] texts;
int itemMax = 10;
HashMap<String, Item> items;
SceneManager sm;
Inventory iv;
color bgColor = color(0);
boolean isStartScreen = true;

void setup() {
  hiraKaku = createFont("mplus-1m-light", 30, true);
  textFont(hiraKaku);
  JSONtexts = loadJSONArray("texts.json");
  texts = new Text[JSONtexts.getStringArray().length];
  for(int i = 0; i< JSONtexts.getStringArray().length;i++) { 
    println(JSONtexts.getString(i));
    texts[i] = new Text(JSONtexts.getString(i));
  }
  sm = new SceneManager();
  iv = new Inventory();
  size(720, 720);
  background(bgColor);
  sm.setWallpaper("wallpaper01.jpg");
  sm.setFloor("floor01.jpg");
  sm.showRoom();
  sm.getText().setVisible(false);
  items = new HashMap<String, Item>();
  if (!items.containsKey("key")) {
    items.put("key", new Item("カギ", "key.jpg", 200, 200, 0.3));
  } else {
    println("カギがすでに登録されてるよ？コード見直そうか？？");
  }

  sm.updateText(texts[1].getStr());
}

void draw() {
  background(bgColor);
  sm.showRoom();
  sm.showTextWindow();
  iv.showBoxes();
  sm.showText();
  items.get("key").show();
}

void mousePressed() {

  if (sm.textWindowCheck(mouseX, mouseY)) {
    if (sm.isTextDrawing()) {
      sm.setLetterShowGap(1);
      println("show gap changed");
    } else {
      sm.getText().setVisible(false);
      println("text is changed invisible");
    }
  } else {
    if (items.get("key").isIn()) {
      items.get("key").setVisible(true);
    }
  }
}
