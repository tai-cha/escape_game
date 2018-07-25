class Item {
  private float xpos, ypos;
  private float scale;
  private String name;
  private PImage image;
  private boolean found = false;
  private boolean visible = false;
  private boolean gettable;
  private int direction;

  Item(String name, String imgPath, float xpos, float ypos, float scale, int direction) {
    image = loadImage(imgPath);
    this.name = name;
    this.xpos = xpos;
    this.ypos = ypos;
    this.scale = scale;
    this.gettable = false;
    this.direction = direction;
  }

  Item(String name, String imgPath, float xpos, float ypos, float scale, boolean gettable, int direction) {
    image = loadImage(imgPath);
    this.name = name;
    this.xpos = xpos;
    this.ypos = ypos;
    this.scale = scale;
    this.gettable = gettable;
    this.direction = direction;
  }

  String getName() {
    return name;
  }

  void setFound(boolean found) {
    this.found = found;
  }

  boolean isFound() {
    return found;
  }

  void setVisible(boolean visible) {
    this.visible = visible;
  }

  boolean isVisible() {
    return visible;
  }

  boolean isGettable()
  {
    return gettable;
  }

 void setGettable(boolean gettable)
  {
    this.gettable = gettable;
  }

  int getDirection() {
    return direction;
  }

  void setImage(String imgPath){
   image = loadImage(imgPath);
  }

  boolean isIn () {
    if (xpos <= mouseX && mouseX <= xpos + image.width*scale && ypos <= mouseY && mouseY <= ypos + image.height*scale) {
      return true;
    } else { 
      return false;
    }
  }

  void move(float dx, float dy) {
    xpos += dx;
    ypos += dy;
  }

  void setPosition(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void show() {
    if (visible && currentDirection == direction) {
      image(image, xpos, ypos, image.width*scale, image.height*scale);
    }
  }
}
