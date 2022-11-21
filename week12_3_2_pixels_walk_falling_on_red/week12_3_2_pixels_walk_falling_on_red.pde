PImage imgBG, imgFloor;
void setup(){
  size(640,484);
  imgBG = loadImage("ice_fire_bg.png");
  imgFloor = loadImage("ice_fire_red_floor.png");
  myFindAllRed();
}
void myFindAllRed(){
  imgFloor.loadPixels();
  for(int i=0; i<imgFloor.width*imgFloor.height; i++){
    if(imgFloor.pixels[i] == color(237, 28,36) ) imgFloor.pixels[i]=color(255,0,0);
    else imgFloor.pixels[i]=color(0);
  }
  imgFloor.updatePixels();
}
int userX=100, userY=100;
void draw(){
  //background(imgBG);
  background(imgFloor);
  ellipse(userX, userY, 5,5);
  int i = calcI(userX, userY+1);//樓下的pixel
  if( imgFloor.pixels[i]==color(0) ) userY++;
}
int calcI(int x, int y){
  return y * imgFloor.width + x;
}
