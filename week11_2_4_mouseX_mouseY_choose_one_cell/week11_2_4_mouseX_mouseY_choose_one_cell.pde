void setup(){
  size(400,400);
  
}
void draw(){
  background(#FFFFF2);
  float r = 20;
  for(float y=50; y<400; y+= sqrt(3)*r){
    for(float x=50; x<400; x+= r+r+r){
      if( dist(mouseX,mouseY,x,y)<r ){
        fill(255,128,128);
      }else fill(255,255,0);
      drawHex(x, y, r); 
    }
    
    float y2=y+sqrt(3)*r/2;
    for(float x=50+r*1.5; x<400; x+= r+r+r){
      if( dist(mouseX,mouseY,x,y)<r ){
        fill(255,128,128);
      }else fill(255,255,0);
      drawHex(x, y2, r); 
    }
  }
}
void drawHex(float x, float y, float r){
  beginShape();
  for(int i=0; i<6; i++){
    float angle = radians(i*60);
    vertex( x + r * cos(angle), y + r * sin(angle) );
  }
  endShape(CLOSE);
}
