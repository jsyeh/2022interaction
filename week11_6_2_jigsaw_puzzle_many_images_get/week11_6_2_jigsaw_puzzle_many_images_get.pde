//拼圖
//Step01: 有圖
//Step02: 切很多的圖
//Step03: 很多圖的座標要改來改去
PImage imgBig;
PImage [][]imgSmall;
void setup(){
  size(800,500);
  imgBig = loadImage("big.png");
  imgSmall = new PImage[5][8];
  for(int i=0; i<5; i++){
    for(int j=0; j<8; j++){
      imgSmall[i][j] = imgBig.get(100*j,100*i, 100,100);
    }
  }
}
void draw(){
  //image(imgBig, 0,0);
  for(int i=0; i<5; i++){
    for(int j=0; j<8; j++){
      image( imgSmall[i][j], j*100, i*100, 80, 80);
      noFill(); rect(j*100,i*100,80, 80);
    }
  }
}
