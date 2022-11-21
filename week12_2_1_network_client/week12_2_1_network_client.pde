import processing.net.*;

Client myClient;

void setup(){
  size(200,200);
  myClient = new Client(this, "127.0.0.1", 5204);
}
void draw(){
  background(#FFFFF2);
  if(myClient.available()>0){
    String line = myClient.readString();
    fill(0); text( line, 100,100);
  }
}
