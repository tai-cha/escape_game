class SceneManager {

  String text = "テキストがセットされていないよ";
  PImage wallpaper,floor;
  
  
  
  void setWallpaper(String imgPath){
    wallpaper = loadImage(imgPath);
  }
  void setFloor(String imgPath){
    floor = loadImage(imgPath);
  }
  
  void showRoom(){
    image(wallpaper,0,0);
    image(floor,0,width*2/3);
  }

  void startScreen() {
    
  }

  void showTextWindow() {
    stroke(#2361FA);
    fill(#2361FA, 30);
    rect(20, height*14/17, width - 40, height*3/17-20, 8);
  }

  void showtext() {
    
  }

  void clearScreen() {
  }
  
}
