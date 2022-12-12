//同時按8個鍵的解法方法
void setup(){
  size(500,300);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<10; i++){
    if(a[i]==1) fill(255,0,0);
    else fill(255);
    
    if(i==0) rect(50*10, 0, 50, 50);
    else rect( 50*i, 0, 50, 50); 
  }
}
int [] a = new int[10];
void keyPressed(){
  print(keyCode, key);
  if(key>='0' && key<='9') a[key-'0']=1;
}
void keyReleased(){
  if(key>='0' && key<='9') a[key-'0']=0;  
}
