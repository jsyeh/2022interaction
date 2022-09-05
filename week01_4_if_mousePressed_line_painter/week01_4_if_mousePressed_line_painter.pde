//1. Java版本,做小畫家, 之後再變網頁
void setup(){
  size(500,500);
}
void draw(){
  if( mousePressed ){
    line(mouseX,mouseY, pmouseX,pmouseY);
  }
}
