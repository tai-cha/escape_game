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
int currentDirection = 1; //1.North 2.East 3.South 4.West

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
    items.put("key", new Item("カギ", "key.png", 200, 200, 0.2, true,1));
  } else {
    println("カギがすでに登録されてるよ？コード見直そうか？？");
  }
  if (!items.containsKey("door")) {
    items.put("door", new Item("ドア", "door_close.png", 440, 177, 1.3,1));
  } else {
    println("ドアがすでに登録されてるよ？コード見直そうか？？");
  }
  if (!items.containsKey("sofa")) {
    items.put("sofa", new Item("ソファー", "sofa.png", 40, 370, 1.0,1));
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
  sm.drawDirectionChangeButton();
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
    //スタート画面のとき
    startScreen = !startScreen;
  } else if(!clearScreen){
    //ゲーム画面のとき
    switch(sm.dirButtonClickChecker()){
      case  LEFT:
        if(currentDirection>1){
          currentDirection--;
        }else{
          currentDirection =4;
        }
        break;
        
      case RIGHT:
        if(currentDirection<4){
          currentDirection++;
        }else{
          currentDirection = 1;
        }
        break;
    }
    println(currentDirection);
    
    if (sm.textWindowCheck(mouseX, mouseY)) {
      sm.textClicked();
    }
    itemsClicked();
  }else {
  //クリア画面のとき
  }
}

void itemsClicked() {

  for (Item item : items.values()) {
    if (item.isGettable() && !item.isFound() && currentDirection == item.direction) {
      if (item.isIn()) {
        item.setFound(true);
        iv.put(item);
        sm.updateText(item.getName()+"を手に入れた！");
        if (item == items.get("key")) {
          canEscape = true;
        }
        item.setVisible(false);
        sm.getText().setVisible(true);
      }
    }
    
    if (!item.isGettable() && item.isIn()) {
      
      if (item == items.get("door")) {
        if (canEscape) {
          items.get("door").setImage("door_opened.png");
          clearScreen = true;
        } else {
          sm.updateText(texts[1].getStr());
          sm.getText().setVisible(true);
        }
      }
      
      if (item == items.get("sofa")) {
        sm.updateText(texts[2].getStr());
        sm.getText().setVisible(true);
      }
    }
  }
}
