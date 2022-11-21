//每五秒出現一個加分道具
//Step01: 算時間
//Step02: 秀出來
int T=0;
boolean showIt=false;
void setup(){
  size(300,300);
}
void draw(){//每秒60次
  T++;
  background(#FFFFF2);
  textSize(30);
  fill(0);
  text("score: "+score, 20, 20); 
  text( T, 150,150);
  if( (T/60) % 5 == 0 ){
    fill(255,0,0);
    text( "Bonus!", 150,200);
    showIt=true;
  }else showIt=false;
  
  if(showIt){
    fill(255,255,0);
    ellipse(150, 100, 50,50);
    if( dist(150,100, mouseX,mouseY)<25 ) { //在 showIt 時, 可以加分
      score+=10;
    }
  }
}
int score=0;
