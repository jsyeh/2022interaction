PImage block;
int [][]open = new int[10][10]; //open[i][j] 對應 j*20, i*20 座標
int [][]bombHere = new int[10][10];
int [][]number = new int[10][10];
void setup() {
  size(200, 240);
  block=loadImage("block.png");
  int bombN = 11;
  for(int i=0; i<bombN; i++){
    int bombI = int(random(10)), bombJ = int(random(10));
    bombHere[bombI][bombJ]=1;
    addAllNumber(bombI,bombJ);
  }
}
void addAllNumber(int i, int j){
  for(int ii=i-1; ii<=i+1; ii++){
    for(int jj=j-1; jj<=j+1; jj++){
      addNumber(ii,jj);
    }
  }
}
void addNumber(int i, int j){
  if(i>=0 && i<10 && j>=0 && j<10){
    number[i][j]++;
  }
}
void draw() {
  background(204);
  for (int i=0; i<=200; i+=20) {
    line(0, i, 200, i);
    line(i, 0, i, 200);
  }
  text("bomb:", 10, 225, 20);
  text("Time:", 100, 225, 20);

  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      if(bombHere[i][j]==1){
        fill(0);
        ellipse(j*20+10, i*20+10, 10, 10);
      }else{
        textAlign(CENTER,CENTER);
        textSize(10);
        text( number[i][j], j*20+10, i*20+10);
      }
      if(open[i][j]==0) image(block, j*20, i*20, 20, 20); 
    }
  }
}
void mousePressed(){
  int i = mouseY/20, j = mouseX/20;
  open[i][j]=1;//打開了,不要畫
}
