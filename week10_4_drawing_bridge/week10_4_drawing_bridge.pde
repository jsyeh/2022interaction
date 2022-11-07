//畫線遊戲, 難在 pixels
//線不規則 == 很多短的小線段
//Idea: 陣列(多大?) vs. ArrayList(可以自動變大!)
void setup(){
  size(500,500);
}
void draw(){
  if(mousePressed){
    line(mouseX,mouseY, pmouseX,pmouseY);
    print(".");
  }
}
