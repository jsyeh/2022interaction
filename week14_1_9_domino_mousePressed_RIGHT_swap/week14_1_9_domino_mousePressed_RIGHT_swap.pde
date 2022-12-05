int N=4;
Domino [] d;
void setup(){
  size(500,500);
  d = new Domino[N];
  for(int i=0; i<N; i++){
    d[i] = new Domino();
  }
  textSize(30);
  textAlign(CENTER,CENTER);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<N; i++){
    d[i].draw();
  }
}
void mousePressed(){
  if(mouseButton==RIGHT){
    for(int i=0; i<N; i++){
      if(d[i].x<mouseX && mouseX<d[i].x+120 && d[i].y<mouseY && mouseY<d[i].y+60){
        int temp=d[i].n1;
        d[i].n1=d[i].n2;
        d[i].n2=temp;
      }
    }
  }
}
void mouseDragged(){
  for(int i=0; i<N; i++){
    if(d[i].x<mouseX && mouseX<d[i].x+120 && d[i].y<mouseY && mouseY<d[i].y+60){
      d[i].x += (mouseX-pmouseX);
      d[i].y += (mouseY-pmouseY);
    }
  }
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
