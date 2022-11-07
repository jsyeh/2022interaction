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
    print(".");
  }
  pushMatrix();
  translate(dx, dy);
  for(int i = 0; i < points.size()-1; i++){
    PVector pt = points.get(i);
    PVector pt2 = points.get(i+1);
    line( pt.x, pt.y, pt2.x, pt2.y );
    ellipse(pt.x, pt.y, 5,5);//point(pt.x, pt.y);
  }
  popMatrix();
}
float dx=0, dy=0;
void keyPressed(){
  if(keyCode==RIGHT) dx++;
  if(keyCode==LEFT) dx--;
  if(keyCode==UP) dy--;
  if(keyCode==DOWN) dy++;
}
