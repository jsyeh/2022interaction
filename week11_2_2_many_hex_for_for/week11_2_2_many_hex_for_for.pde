void setup(){
  size(400,400);
  
}
void draw(){
  background(#FFFFF2);
  //drawHex(100,100, 30);
  float r = 20;
  //for(int y=50; y<400; y+= sqrt(3)*r){
    //int x = 50;
    //drawHex(x, y, r); 
  //}
  for(int y=50; y<400; y+= sqrt(3)*r){
    for(int x=50; x<400; x+= r+r+r){
      drawHex(x, y, r); 
    }
  }
  
}
void drawHex(int x, int y, float r){
  beginShape();
  for(int i=0; i<6; i++){
    float angle = radians(i*60);
    vertex( x + r * cos(angle), y + r * sin(angle) );
  }
  endShape(CLOSE);
}
