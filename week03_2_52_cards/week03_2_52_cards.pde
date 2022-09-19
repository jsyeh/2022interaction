void setup(){
  size(700,700);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){ //迴圈
    int x = (i%10)*60; //除法10餘數,個位數
    int y = int(i/10)*120;//十位數
    rect( x, y, 60,120 );
  }
}
