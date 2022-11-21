//很長的背景圖,要能橫向捲軸移動
PImage imgBG;
void setup(){
  size(540,540);
  imgBG = loadImage("big_bg.png");
}
int shift=0, userX=10, userY=280;
void draw(){
  image(imgBG,-shift,0);
  ellipse(userX, userY, 20,20);
}
void keyPressed(){
  if(keyCode==RIGHT){
    if(userX>540-10) shift+=3;
    else userX+=3;
  }
}
