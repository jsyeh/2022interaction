//要能橫向捲軸移動
PImage imgBG;
float []stoneX=new float[20];
void setup(){
  size(540,540);
  stoneX[0] = random(540, 1000);
  for(int i=1; i<20; i++){
    stoneX[i]=stoneX[i-1]+random(100,200);
  }
}
int shift=0;
int dinoX=280, dinoY=280;
void draw(){
  background(#FFFFF2);
  for(int i=0; i<20; i++){
    rect(stoneX[i]-shift, 280, 20,20);
    if( stoneX[i]-shift < -20 ){ //recycle
      stoneX[i] = stoneX[(i-1+20)%20]+random(100,200);
    }
  }
  ellipse(dinoX, dinoY, 20,20);
  shift +=4;
}
