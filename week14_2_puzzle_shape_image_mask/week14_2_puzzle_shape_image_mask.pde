PImage img1, img2, imgShape;
int [] maskArray;
int [] maskArray2;
void setup(){
  size(500,500);
  img1 = loadImage("2.jpg");
  img2 = loadImage("2.jpg");
  imgShape = loadImage("shape.png");
  //print(imgShape.width, imgShape.height);
  maskArray = new int[300*300];
  maskArray2 = new int[300*300];
  imgShape.loadPixels();
  for(int i=0; i<300*300; i++){
    if( imgShape.pixels[i] == color(255,0,0) ){
      maskArray[i]=255;
    }else maskArray[i]=0;
    
    if( imgShape.pixels[i] == color(0,255,0) ){
      maskArray2[i]=255;
    }else maskArray2[i]=128;
  }
  
  img1.mask(maskArray);
  img2.mask(maskArray2);
}
void draw(){
  background(#FFFFF2);
  image(img1,0,0);
  image(img2,mouseX,mouseY);
  //image(imgShape, 0,0);
}
