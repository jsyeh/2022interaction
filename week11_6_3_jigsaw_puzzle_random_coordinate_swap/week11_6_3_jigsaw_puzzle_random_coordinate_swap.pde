//拼圖
//Step01: 有圖
//Step02: 切很多的圖
//Step03: 很多圖的座標要改來改去
PImage imgBig;
PImage [][]imgSmall;
PVector [][] coord;
void setup(){
  size(800,500);
  imgBig = loadImage("big.png");
  imgSmall = new PImage[5][8];
  coord = new PVector[5][8];
  for(int i=0; i<5; i++){
    for(int j=0; j<8; j++){
      imgSmall[i][j] = imgBig.get(100*j,100*i, 100,100);
      coord[i][j] = new PVector(100*j,100*i);
    }
  }
  for(int k=0; k<100; k++){
    int i1=int(random(5)), i2=int(random(5));
    int j1=int(random(8)), j2=int(random(8));
    PVector temp = new PVector(coord[i1][j1].x, coord[i1][j1].y);
    coord[i1][j1]=coord[i2][j2];
    coord[i2][j2]=temp;
  }
}
void draw(){
  //image(imgBig, 0,0);
  for(int i=0; i<5; i++){
    for(int j=0; j<8; j++){
      image( imgSmall[i][j], coord[i][j].x, coord[i][j].y, 80, 80);
      noFill(); rect(j*100,i*100,80, 80);
    }
  }
}
