Domino d;
void setup(){
  size(500,500);
  
  d = new Domino();
  textSize(30);
  textAlign(CENTER,CENTER);
}
void draw(){
  background(#FFFFF2);
  d.draw();
}
class Domino{
  int x, y;
  int n1, n2;
  Domino(){
    x = (int) random(100,400);
    y = (int) random(100,400);
    n1 = (int) random(10);
    n2 = (int) random(10);
  }
  void draw(){
    fill(50);
    rect(x+60,y, 60,60);
    rect(x,y, 60,60);
    fill(255);
    text(n1, x+30,y+30);
    text(n2, x+60+30,y+30);    
  }
}
