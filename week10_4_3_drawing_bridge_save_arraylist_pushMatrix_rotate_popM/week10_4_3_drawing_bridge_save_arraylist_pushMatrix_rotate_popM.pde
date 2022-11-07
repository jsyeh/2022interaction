//畫線遊戲, 難在 pixels
//線不規則 == 很多短的小線段
//Idea: 陣列(多大?) vs. ArrayList(可以自動變大!)
ArrayList<PVector> points; //很多個 PVector 座標
void setup(){
  size(500,500);
  points = new ArrayList<PVector>();
}
void draw(){
  background(#FFFFF2);
  if(mousePressed && (mouseX!=pmouseX || mouseY!=pmouseY) ){
    points.add( new PVector(mouseX,mouseY) );
    line(mouseX,mouseY, pmouseX,pmouseY);
    //print(".");
    if(mouseX>x1) x1=mouseX;
    if(mouseX<x0) x0=mouseX;
    if(mouseY>y1) y1=mouseY;
    if(mouseY<y0) y0=mouseY;
    println( (x0+x1)/2, (y0+y1)/2 );
  }
  pushMatrix();
    translate( (x0+x1)/2, (y0+y1)/2);
    rotate(angle);
    translate( -(x0+x1)/2, -(y0+y1)/2);
    for(int i = 0; i < points.size()-1; i++){
      PVector pt = points.get(i);
      PVector pt2 = points.get(i+1);
      line( pt.x, pt.y, pt2.x, pt2.y );
      //ellipse(pt.x, pt.y, 5,5);//point(pt.x, pt.y);
    }
  popMatrix();
}
float angle=0;
float x0=-1, x1=-1, y0=-1, y1=-1;
void mousePressed(){
  if(x0==-1){
    x0 = x1 = mouseX;
    y0 = y1 = mouseY;
  }
}
void keyPressed(){
  if( keyCode==UP) angle+=0.1;
  if( keyCode==DOWN) angle-=0.1;
  if( key==' ') angle=0;
}
