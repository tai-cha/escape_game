import processing.sound.*;
import java.util.Map;

PFont mplus;
PFont title;
Text[] texts;
int itemMax = 10;
HashMap<String, Item> items;
SceneManager sm;
Inventory iv;
color bgColor = color(0);
boolean isStartScreen = true;

void setup() {
  mplus = createFont("mplus-1m-light", 30, true);
  title = createFont("mplus-1m-light", 70, true);
  textFont(mplus);
  JSONArray JSONtexts = loadJSONArray("texts.json");
  texts = new Text[JSONtexts.getStringArray().length];
  for (int i = 0; i< JSONtexts.getStringArray().length; i++) { 
    texts[i] = new Text(JSONtexts.getString(i));
  }
  sm = new SceneManager();
  iv = new Inventory();
  size(720, 720);
  background(bgColor);
  sm.showRoom();
  sm.getText().setVisible(false);
  items = new HashMap<String, Item>();
  if (!items.containsKey("key")) {
    items.put("key", new Item("カギ", "key.jpg", 200, 200, 0.3));
  } else {
    println("カギがすでに登録されてるよ？コード見直そうか？？");
  }

  sm.updateText(texts[0].getStr());
}

void draw() {
  background(bgColor);
  sm.showRoom();
  if (isStartScreen) {
    sm.startScreen();
  } else {
    sm.showTextWindow();
    iv.showBoxes();
    sm.showText();
  }
  if (items.get("key").isVisible()) {
    items.get("key").show();
  }
}

void mousePressed() {
  if (isStartScreen) {
    isStartScreen = !isStartScreen;
  } else {
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
}
