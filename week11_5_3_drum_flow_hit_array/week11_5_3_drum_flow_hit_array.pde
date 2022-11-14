//step03-1_太鼓達人
//Step01: 介面先放出來
//Step02: 要會流動
//Step03: 測試拍點
//Step04: 跟著節奏
PImage imgBG, imgRed, imgTab;
int [] array = {1, 2, 3, 5, 7, 8, 9 };//拍點: 絕對時間
void setup(){
  size(1000,530);
  imgBG = loadImage("bg.png");
  imgRed = loadImage("red.png");
  imgTab = loadImage("tab.png");//用來蓋住超過的red點
}
//int x1=500, x2=400;
float dt=0;
void draw(){
  background(imgBG);
  for(int i=0; i < array.length; i++){
    float x = 810 + array[i]*90 - dt;
    image(imgRed, x,165);
  }
  image(imgTab, 0,0);//用來蓋住超過的red點
  dt++;
}
