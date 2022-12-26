//血戰古寧頭 桌遊 if太多 
//規則編輯器 一堆陣列 可以用整數、字串, 來讓判斷可以一致化
int [] hand = {0, 2, 5};// 0>2, 2>5, 5>5
String [] chinese={"石頭", "剪刀", "布"};
int left, right;
void guess(){
  left = (int)random(3); //index
  right = (int)random(3);
}
void setup(){
  size(500,300);
  PFont font = createFont("標楷體",20);
  textFont(font);
  guess();
}
void draw(){
  background(#FFFFF2);
  fill(0);
  textSize(20);
  text(left, 100,130);
  text(right, 400,130);
  text(hand[left], 100,150);
  text(hand[right], 400,150);
  text(chinese[left], 100,180);
  text(chinese[right], 400,180);
  if(win==1) text("Left Win", 100,80);
  if(win==2) text("Right Win", 100,80);
}
int win=0;
void mousePressed(){
  if(mouseButton==LEFT) guess();
  if(mouseButton==RIGHT) {
    runRules();
    /*
    if(left==0 && right==1) win=1;//left
    if(right==0 && left==1) win=2;//right
    if(left==1 && right==2) win=1;
    if(right==1 && left==2) win=2;
    if(left==2 && right==0) win=1;
    if(right==2 && left==0) win=2;*/
  }
}
int [][]rules = {
  {0,1, 1},
  {1,0, 2},
  {1,2, 1},
  {2,1, 2},
  {2,0, 1},
  {0,2, 2}
};
void runRules(){
  for(int i=0; i<rules.length; i++){
    if(left==rules[i][0] && right==rules[i][1]) win=rules[i][2];
  }
}
