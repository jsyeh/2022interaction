PImage block;
int [][]open = new int[10][10]; //open[i][j] 對應 j*20, i*20 座標
void setup() {
  size(200, 240);
  block=loadImage("block.png");
  int number=11;
  for (int i=0; i<number; i++){
    int bomb[]={10, 30, 50, 70, 90, 110, 130, 150, 170, 190};
    int bombx=bomb[int(random(bomb.length))];
    int bomby=bomb[int(random(bomb.length))];
    fill(0);
    ellipse(bombx, bomby, 10, 10);
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
      image(block, j*20, i*20, 20, 20); 
    }
  }
  if(ii>=0) rect(jj, ii, 20, 20);
}
int ii=-1, jj=-1;
void mousePressed(){
  int i = mouseY/20, j = mouseX/20;
  ii = i*20;
  jj = j*20;
}
