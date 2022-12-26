PVector [] pt;
void setup(){
  size(500,500);
  pt = new PVector[5];
  for(int i=0; i<5; i++){
    pt[i] = new PVector(100+70*i, 100);
  }
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<5-1; i++){
    line(pt[i].x, pt[i].y, pt[i+1].x, pt[i+1].y);
  }
  for(int i=0; i<5; i++){
    ellipse( pt[i].x, pt[i].y, 5, 5);
  }
}
