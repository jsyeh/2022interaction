//如何做出 invisible pixels[] 地圖,用來程式判斷
PImage imgBG;
PGraphics pg;
PGraphics invis;
void setup(){
  size(720,556);
  imgBG = loadImage("BG.png");
  pg = createGraphics(720,556);
  invis = createGraphics(720,556);
  invis.beginDraw();
  background(255);
  invis.endDraw();
}
void draw(){
  background(imgBG);
  //image(imgBG, 0,0);
  image(pg, 0,0);
  if(keyPressed){
    background(255);
    image(invis, 0, 0);
  }
  ellipse(ballX,ballY,30,30);
  invis.loadPixels();
  color now = invis.pixels[II(ballX,ballY+1)];
  if ( red(now) > blue(now) ){ 
    //don't move
  } else {
    ballY ++;
  }
  
}
int II(int x, int y){  // 找到球對應的pixels的index
  return x + y * 720;
}
int ballX=360, ballY=0;
void mouseDragged(){
  pg.beginDraw();
  pg.line(mouseX, mouseY, pmouseX, pmouseY);
  pg.endDraw();
  invis.beginDraw();
  invis.stroke(255,0,0);
  invis.line(mouseX, mouseY, pmouseX, pmouseY);
  invis.endDraw();
}
