//拼圖的不規則大小,如何做出吸附的效果
PImage imgEmpty, img;
int[]mask1=new int[500*500];
PImage []puzzle;
void setup(){
  size(700,700);
  imgEmpty=loadImage("empty.png");
  img = loadImage("img.png");
  puzzle = new PImage[4];
  for(int i=0; i<4; i++){
    findPuzzle(i);
    img.mask(mask1);
    puzzle[i] = img.get();
  }
  shift = new PVector[4];
  coord = new PVector[4];
  for(int i=0; i<4; i++){
    int x = -i, y=0;//int x = (int)random(-4,0), y = 0;
    shift[i] = new PVector(x*125, y*125);
    coord[i] = new PVector(i*125, y*125);
  }
  for(int k=0; k<10; k++){
    int r1=int(random(4));
    int r2=int(random(4));
    PVector temp=coord[r1];
    coord[r1]=coord[r2];
    coord[r2]=temp;
  }
}
void findPuzzle(int k){
  color [] cc = {#00FF00, #FFFF00, #FF00FF, #0000FF};
  imgEmpty.loadPixels();
  for(int i=0; i<500*500; i++){
    color c = imgEmpty.pixels[i];
    if( imgEmpty.pixels[i]==cc[k] ){//if( green(c)==255 && red(c)==0 && blue(c)==0 ){
      mask1[i] = 255;
    }else{ mask1[i]=0; }
  }
}
PVector [] shift;
PVector [] coord;
void draw(){
  background(255);
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      rect(j*width/4,i*height/4, width/4, height/4);
    }
  }
  //image(puzzle[0], 0,0);
  //image(puzzle[1], 0,0);
  //image(puzzle[2], 0,0);
  //image(puzzle[3], px, py);
  for(int i=0; i<4; i++){
    image(puzzle[i], coord[i].x+shift[i].x, coord[i].y+shift[i].y);
  }
}
float px=0, py=0;
void mouseDragged(){
  float min=999999;
  int selectI=0;
  for(int i=0; i<4; i++){
    float d = dist(coord[i].x+125/2, coord[i].y+125/2, mouseX,mouseY);
    if(d<min){
      min = d;
      selectI=i;
    }
  }
  coord[selectI].x += mouseX-pmouseX;
  coord[selectI].y += mouseY-pmouseY;
}
