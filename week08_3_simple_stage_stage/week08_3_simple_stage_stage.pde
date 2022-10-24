void setup(){
  size(400,300);
}
int stage=1;//1:start, 2:playing
void draw(){
  background(255,255,0);
  fill(255,0,0);
  textSize(80);
  if(stage==1){
    text("stage 1", 100,100);
  }else if(stage==2){
    text("stage 2", 100,100);
  }
}
void mousePressed(){
  if(stage==1) stage=2;
  else if(stage==2) stage=1;
}
