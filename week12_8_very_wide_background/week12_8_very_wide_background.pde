//很長的背景圖,要能橫向捲軸移動
PImage imgBG;
void setup(){
  size(540,540);
  imgBG = loadImage("big_bg.png");
}
void draw(){
  image(imgBG,0,0);
}
