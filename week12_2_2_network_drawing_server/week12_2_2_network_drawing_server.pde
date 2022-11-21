import processing.net.*;

Server myServer;

void setup(){
  size(200,200);
  myServer = new Server(this, 5204);
  
}
void draw(){
//  myServer.write("Hello");
}
void mouseDragged(){
  myServer.write(mouseX);
  myServer.write(mouseY);
}
