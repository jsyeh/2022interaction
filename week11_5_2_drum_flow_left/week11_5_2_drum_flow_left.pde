//step03-1_太鼓達人
//Step01: 介面先放出來
//Step02: 要會流動
//Step03: 測試拍點
//Step04: 跟著節奏
PImage imgBG, imgRed, imgTab;
void setup(){
  size(1000,530);
  imgBG = loadImage("bg.png");
  imgRed = loadImage("red.png");
  imgTab = loadImage("tab.png");//用來蓋住超過的red點
}
int x1=500, x2=400;
void draw(){
  background(imgBG);
  image(imgRed, x1,165);
  image(imgRed, x2,165);
  image(imgTab, 0,0);//用來蓋住超過的red點
  x1--;
  x2--;
  if(x1<100) x1=1000;
  if(x2<100) x2=1000;
}
