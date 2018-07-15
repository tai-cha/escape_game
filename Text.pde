class Text {
  private String str;
  private boolean visible;

  Text() {
    str ="テキストは空だよ";
    visible = false;
  }
  
  Text(String str) {
    this.str = str;
    visible = false;
  }
  
  Text(String str,boolean visible) {
    this.str =str;
    this.visible = visible;
  }
  
  void setStr(String str) {
    this.str = str;
  }
  
  String getStr() {
    return str;
  }
  
  void setVisible(boolean visible) {
    this.visible = visible;
  }
  
  boolean isVisible() {
    return visible;
  }
  
}
