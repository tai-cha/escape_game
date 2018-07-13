class Item {
  int id;
  float xpos, ypos;
  float scale;
  String name;
  PImage image;
  boolean found = false;

  Item(String name, String imgPath, float xpos, float ypos, float scale) {
    this.name = name;
    image = loadImage(imgPath);
    this.xpos = xpos;
    this.ypos = ypos;
    this.scale = scale;
  }

  void show() {
    image(image, xpos, ypos);
  }
}
