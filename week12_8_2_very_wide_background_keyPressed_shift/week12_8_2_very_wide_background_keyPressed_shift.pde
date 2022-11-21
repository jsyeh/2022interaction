//很長的背景圖,要能橫向捲軸移動
PImage imgBG;
void setup(){
  size(540,540);
  imgBG = loadImage("big_bg.png");
}
int shift=0;
int dinoX=280, dinoY=280;
void draw(){
  image(imgBG,-shift,0);
  ellipse(dinoX, dinoY, 20,20);  
}
void keyPressed(){
  if(keyCode==RIGHT) shift += 3;
}
