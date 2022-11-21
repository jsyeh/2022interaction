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
int stage=1;//1: start, 2: playing, 3: game over
void draw(){
  if(stage==1){
    background(255,255,0);
    if(mousePressed) stage=2;
  }else if(stage==2){
    background(#FFFFF2);
    for(int i=0; i<20; i++){
      rect(stoneX[i]-shift, 280, 20,20);
      if( stoneX[i]-shift < -20 ){ //recycle
        stoneX[i] = stoneX[(i-1+20)%20]+random(100,200);
      }
      if( dist(dinoX,dinoY, stoneX[i]-shift, 280) < 20 ){
        stage = 3;//game over
      }
    }
    ellipse(dinoX, dinoY, 20,20);
    shift +=4;
  }else if(stage==3){
    background(255,0,0);
  }
}
