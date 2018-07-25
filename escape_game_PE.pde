import processing.sound.*;
import java.util.Map;

PFont mplus;
PFont title;
Text[] texts;
int textNum = 0;
int itemMax = 10;
HashMap<String, Item> items;
SceneManager sm;
Inventory iv;
color bgColor = color(0);
boolean startScreen = true;
boolean clearScreen = false;
boolean canEscape = false;

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
    items.put("key", new Item("カギ", "key.png", 200, 200, 0.2, true));
  } else {
    println("カギがすでに登録されてるよ？コード見直そうか？？");
  }
  if (!items.containsKey("door")) {
    items.put("door", new Item("ドア", "door_close.png", 370, 170, 1.3));
  } else {
    println("ドアがすでに登録されてるよ？コード見直そうか？？");
  }
  if (!items.containsKey("sofa")) {
    items.put("sofa", new Item("ソファー", "sofa.png", 40, 370, 1.0));
  } else {
    println("ソファーがすでに登録されてるよ？コード見直そうか？？");
  }

  items.get("key").setVisible(true);
  items.get("door").setVisible(true);
  items.get("sofa").setVisible(true);

  sm.updateText(texts[textNum].getStr());
  sm.getText().visible = true;
}

void draw() {
  background(bgColor);
  sm.showRoom();
  if (startScreen) {
    sm.startScreen();
  } else if (!clearScreen) {
    gameScreen();
  } else {
    sm.clearScreen();
  }
}

void gameScreen() {
  sm.showTextWindow();
  iv.showBoxes();
  iv.showItems();
  sm.showText();
  itemDraw();
}

void itemDraw() {
  for (Item item : items.values()) {
    item.show();
  }
}

void mousePressed() {
  if (startScreen) {
    startScreen = !startScreen;
  } else {
    if (sm.textWindowCheck(mouseX, mouseY)) {
      textClicked();
    }
    itemsClicked();
  }
}

void textClicked () {
  if (sm.isTextDrawing()) {
    sm.setLetterShowGap(1);
    println("show gap changed");
  } else {
    sm.getText().setVisible(false);
    println("text is changed invisible");
    sm.updateText(texts[textNum].getStr());
  }
}

void itemsClicked() {
  /*  if (items.get("key").isIn()) {
   items.get("key").setVisible(false);
   } */
  for (Item item : items.values()) {
    if (item.isGettable() && !item.isFound()) {
      if (item.isIn()) {
        item.setFound(true);
        iv.put(item);
        if (item == items.get("key")) {
          canEscape = true;
        }
        item.setVisible(false);
      }
    }
    if (!item.isGettable()) {
      if (item.isIn()) {
        if (item == items.get("door")) {
          if (canEscape) {
            clearScreen = true;
          }
        }
      }
    }
  }
}
