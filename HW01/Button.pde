class Button {
  
  String buttonText;
  float x , y, buttonWidth, buttonHeight;
  color c;   
  color hover;
  int textSize;
  int depth;
  String containerID;
  PFont font;
 
  public Button(float x, float y, float buttonWidth, float buttonHeight, color c, String buttonText){
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.c = c;
    this.buttonText = buttonText;
    textSize = 15;
    containerID = "";
    depth = 1;
    font = loadFont("Futura-Medium-48.vlw");
  }
  
  void draw(){
    draw(c); 
  }
  
  void draw(color override){
    fill(override);
    rectMode(CENTER);
    noStroke();
    rect(x, y, buttonWidth, buttonHeight);
    textAlign(CENTER, CENTER);
    fill(0,0,0);  
    float renderTextSize = textSize;
    if(textSize >= buttonHeight){
      renderTextSize = int(buttonHeight/2);  
    }
    if(renderTextSize > 0){
      textFont(font, textSize);
      text(buttonText, x, y, buttonWidth, buttonHeight);  
    }
  }
  
  boolean contains(float xCord, float yCord){
   float left = x - buttonWidth/2;
   float right = x + buttonWidth/2;
   float bottom = y - buttonHeight/2;
   float top = y + buttonHeight/2;
   if(xCord >= left && xCord <= right){
     if(yCord >= bottom && yCord <= top){
       return true;
     }
    }
    return false;  
  }
  
  
  void setColor(color c){
    this.c = c;  
  }
  
  void setButtonText(String buttonText){
    this.buttonText = buttonText;
  }
  
  void setWidth(int buttonWidth){
    this.buttonWidth = buttonWidth;
  }
  
  void setHeight(int buttonHeight){
    this.buttonHeight = buttonHeight;
  }
  
  void setX(int x){
    this.x = x;
  }
  
  void setY(int y){
    this.y = y;  
  }
  
  void setTextSize(int size){
    this.textSize = size;
  }
}