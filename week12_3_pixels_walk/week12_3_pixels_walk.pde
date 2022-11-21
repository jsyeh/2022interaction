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
    else imgFloor.pixels[i]=color(255);
  }
  imgFloor.updatePixels();
}
void draw(){
  //background(imgBG);
  background(imgFloor);
}
