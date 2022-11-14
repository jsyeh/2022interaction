//step03-1_太鼓達人
//Step01: 介面先放出來
//Step02: 要會流動
//Step03: 測試拍點
//Step04: 跟著節奏
PImage imgBG, imgRed;
void setup(){
  size(1000,530);
  imgBG = loadImage("bg.png");
  imgRed = loadImage("red.png");
}
void draw(){
  background(imgBG);
  image(imgRed, 500,165);
  image(imgRed, 400,165);
}
