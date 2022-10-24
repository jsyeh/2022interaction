//目標: class物件: 每個水果都可以用物件生出來(值、函式)
String line="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
class Fruit{
  float x, y, vx, vy;
  boolean flying;
  int delay;
  char c;//水果對應的字母
  PApplet sketch;//為了讓random可以用,修改一下
  Fruit(PApplet _sketch){ //建構子: 一開始要做的事
    sketch = _sketch;//為了讓random可以用,修改一下
    reset();
  }
  void reset(){
    x = sketch.random(100.0, 300.0);//為了讓random可以用,修改一下
    y = 300;
    vx = sketch.random(-2,+2);//為了讓random可以用,修改一下
    vy = -13;
    flying = true;
    delay = int(random(150));
    int i=int(random(26));
    c = line.charAt(i);
  }
  void update(){
    if(delay>0){
      delay--;
      return;
    }
    x += vx;
    y += vy;
    vy += 0.98/3;//重力加速度    
    if(y>300) reset();
  }
}
