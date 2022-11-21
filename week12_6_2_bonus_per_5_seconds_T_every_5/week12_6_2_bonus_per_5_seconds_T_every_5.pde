//每五秒出現一個加分道具
//Step01: 算時間
//Step02: 秀出來
int T=0;
void setup(){
  size(300,300);
}
void draw(){//每秒60次
  T++;
  background(#FFFFF2);
  textSize(30);
  fill(0);
  text( T, 150,150);
  //if(T/60==5 || T/60==10 || T/60==15 || T/60==20){
  if( (T/60) % 5 == 0 ){
  //int Tsecond = T/60;
  //if( Tsecond % 5 == 0 ){
    fill(255,0,0);
    text( "Bonus!", 150,200);
  }
}
