# 2022互動技術

# Week01

## step01-1_簡介、解壓縮

https://zh.wikipedia.org/zh-tw/Processing
Processing是一種開源程式語言，專門為電子藝術和視覺互動設計而創建，其目的是通過可視化的方式輔助編程教學，並在此基礎之上表達數字創意。Processing也指Processing語言的集成開發環境(IDE)。2001年，MIT媒體實驗室的 Casey Reas 和 Benjamin Fry 發起了此計劃。其固定目標之一便是作為一個有效的工具，通過激勵性的可視化反饋幫助非程式設計師進行編程的入門學習。Processing語言建立在Java語言的基礎之上，但使用簡化的語法和圖形編程模型。此外也有以Processing為基礎，但使用Javascript做框架的P5.js


## step01-2_設定程式的畫面大小size(), 設定背景色background(),使用Color Selector幫忙挑

```processing
size(500,500);//大視窗
```

可利用Tool(工具)-Color Selector(色彩選擇器),挑色彩
```processing
size(500,500);//大視窗
background(#FAFC94);//淡黃色背景
```
## step02-1_填充色彩fill() 四邊形rect()

```processing
size(500,500);
background(#FAFC94);
fill(#94D0FC);
rect(100,100, 100,150);
```
## step02-1_靜態模式、互動模式,差別在 void setup() 及 void draw() 小心要寫完才不會弄混了。最後用 mouseX mouseY 來改變座標

```processing
//active
void setup(){
  size(500,500);
}
void draw(){
  background(#FAFC94);
  fill(#94D0FC);
  rect(100,100, 100,150);
  rect(mouseX,mouseY, 100,150);
}
```


## step02-3_把互動的程式 copy 到 processing to p5.js 的網頁 pde2js.herokuapp.com 貼到左邊,翻譯到右邊,就可拿來 p5.js 用, 執行會跳出網頁

- 把互動的程式 copy 到
- processing to p5.js 的網頁 
- https://pde2js.herokuapp.com 
- 貼到左邊,翻譯到右邊,
- 就可拿來 p5.js 用, 
- 執行會跳出網頁

```javascript
function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0xFA, 0xFC, 0x94));
    fill(color(0x94, 0xD0, 0xFC));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}

function initializeFields() {
}
```

## step03-1_想要做出簡單的小畫家,所以畫過的地方需要留下來,不呼叫 background(), 直接用 line()來畫, 配 mouseX mouseY及 pmouseX pmouseY 來連線。想要有好的體驗,就 if(mousePressed) 才畫線

```processing
//1. Java版本,做小畫家, 之後再變網頁
void setup(){
  size(500,500);
}
void draw(){
  if( mousePressed ){
    line(mouseX,mouseY, pmouseX,pmouseY);
  }
}
```

## step03-2_做出不同色彩的小畫家,使用keyPressed()配合 if() key 及 stroke() 來完成

```processing
void setup(){//只執行1次
  size(500,500);//開個500x500窗
  background(#FFFFF2);//先背景
  stroke(255,0,0); //筆觸紅色
}
void draw(){//每秒60次
  if( mousePressed ){
    line(mouseX,mouseY, pmouseX,pmouseY);
  }
}
void keyPressed(){//如果有按下按鍵
  if( key == '1' ) stroke(#FA0834);
  if( key == '2' ) stroke(#FACA08);
  if( key == '3' ) stroke(#FAF208);
  if( key == '4' ) stroke(#08FA66);
  if( key == '5' ) stroke(#0829FA);
  //你自己加
}
```

## step03-3_最後可以匯出到網頁版 p5.js ,並上傳 GitHub

```javascript

function setup() {
    initializeFields();
    // 只執行1次
    // 開個500x500窗
    createCanvas(500, 500);
    // 先背景
    background(color(0xFF, 0xFF, 0xF2));
    // 筆觸紅色
    stroke(255, 0, 0);
}

function draw() {
    // 每秒60次
    if (mouseIsPressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
}

function keyPressed() {
    // 如果有按下按鍵
    if (key == '1')
        stroke(color(0xFA, 0x08, 0x34));
    if (key == '2')
        stroke(color(0xFA, 0xCA, 0x08));
    if (key == '3')
        stroke(color(0xFA, 0xF2, 0x08));
    if (key == '4')
        stroke(color(0x08, 0xFA, 0x66));
    if (key == '5')
        stroke(color(0x08, 0x29, 0xFA));
// 你自己加
}

function initializeFields() {
}
```


# Week02

今天的主題是卡片

## step01-1_介紹線上點名的方法、複習上週的size()及rect(), 但修改參數,加上圓弧, 接下來讓同學可以自己做出卡片

先畫出一張卡片 week02_1_one_card

```processing
//畫卡片
size(500,500);
int W=25;
rect(100-10,100-10, 170, 270, 20); //弧度
fill(#FF00F2);
rect(100,100, 150, 250, 20); //弧度
```


```processing
//畫卡片
size(500,500);
int W=20;
rect(100-W/2,100-W/2, 150+W, 250+W, 20); //弧度
fill(#FF00F2);
rect(100,100, 150, 250, 20); //弧度
```

## step01-2_示範加減法,方便算出邊緣修改的量, 接下來利用自己發明的函式drawCard()來畫卡片, 配合參數, 讓卡片可以放在不同的位置

```processing
void setup(){
  size(500,500);
}
int W=25;
void draw(){
  drawCard();//使用函式
}
void drawCard(){
  fill(255);
  rect(100-W/2,100-W/2, 150+W, 250+W, 20); //弧度
  fill(#FF00F2);
  rect(100,100, 150, 250, 20); //弧度  
}
```

接下來修改函式, 讓它可接受不同的參數

```processing
void setup(){
  size(500,500);
}
int W=25;
void draw(){
  drawCard(100,100);//使用函式
  drawCard(130,130);//使用函式
  drawCard(160,160);//使用函式
}
void drawCard(int x, int y){
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#FF00F2);
  rect(x,y, 150, 250, 20); //弧度  
}
```

## step02-1_要改成PokerCard樸克牌, 所以將 drawCard()改寫成drawPokerCard()並將參數改變。這樣便能將牌面畫出來

```processing
void setup(){
  size(500,500);
}
int W=25;
void draw(){
  drawPokerCard(100,100, "S4");//使用函式
  drawPokerCard(130,150, "H3");//使用函式
  drawPokerCard(160,200, "D5");//使用函式
  drawPokerCard(190,250, "CJ");//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#FF00F2);
  rect(x,y, 150, 250, 20); //弧度
  fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```


## step02-2_想要有中文字,所以createFont()準備好中文字型 標楷體,再利用textFont()設定字型,便能有中文

```processing
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
}
int W=25;
void draw(){
  drawPokerCard(100,100, "黑桃4");//使用函式
  drawPokerCard(130,150, "紅心3");//使用函式
  drawPokerCard(160,200, "方塊5");//使用函式
  drawPokerCard(190,250, "梅花J");//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#FF00F2);
  rect(x,y, 150, 250, 20); //弧度
  fill(0);//黑色的字
  textSize(40);
  text( face, x, y+40 );
}
```

## step02-3_想要有不同的色彩的字,所以針對牌面的字分析,黑桃、梅花是黑色,所以不是黑桃也不是梅花,便是紅色。利用 indexOf()來完成測試判斷

```processing
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
}
int W=25;
void draw(){
  drawPokerCard(100,100, "黑桃4");//使用函式
  drawPokerCard(130,150, "紅心3");//使用函式
  drawPokerCard(160,200, "方塊5");//使用函式
  drawPokerCard(190,250, "梅花J");//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#6FF9FF);
  rect(x,y, 150, 250, 20); //弧度
  //fill(0);//黑色的字
  if( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```

## step03-1_如何洗牌shuffle亂數洗牌, 想到之前教過random()亂數,可以拿來用。但是亂數有小數點怎麼辦,就取整數就好了。但是中文的花色名稱怎麼辦,利用陣列就好了。這裡比較難,希望大家可以順利。

```processing
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
  String [] flower = {"黑桃","紅心","方塊","梅花"};//陣列
  face1 = flower[int(random(4))] + int(random(13)+1);
  face2 = flower[int(random(4))] + int(random(13)+1);
  face3 = flower[int(random(4))] + int(random(13)+1);
  face4 = flower[int(random(4))] + int(random(13)+1);
  //取整數 0...12 所以再加1
}//洗牌的英文 Shuffle
String face1, face2, face3, face4;
void draw(){
  drawPokerCard(100,100, face1 );//使用函式
  drawPokerCard(130,150, face2 );//使用函式
  drawPokerCard(160,200, face3 );//使用函式
  drawPokerCard(190,250, face4 );//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  int W=25;
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#6FF9FF);
  rect(x,y, 150, 250, 20); //弧度
  //fill(0);//黑色的字
  if( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```

# Week03

主題: 撲克牌、圍棋、象棋

1. (複習) 放牌、秀牌、洗牌
2. 洗牌的正確方法: 
2.1. 52張牌 0.....51
2.2. 把它 兩兩亂數對調
2.3. 取前面4張
3. 如何選到牌
4. class 物件

心理學實驗--學習、記憶

檢討Blog的內容、格式

## step01-1_先把上週最後的程式拿來用, 同時加上 mousePressed()便呼叫 myShuffle()洗牌的功能

```processing
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
  myShuffle();
}//洗牌的英文 Shuffle
void myShuffle(){
  String [] flower = {"黑桃","紅心","方塊","梅花"};//陣列
  face1 = flower[int(random(4))] + int(random(13)+1);
  face2 = flower[int(random(4))] + int(random(13)+1);
  face3 = flower[int(random(4))] + int(random(13)+1);
  face4 = flower[int(random(4))] + int(random(13)+1);//取整數 0...12 所以再加1
}
void mousePressed(){
  myShuffle();
}
String face1, face2, face3, face4;
void draw(){
  drawPokerCard(100,100, face1 );//使用函式
  drawPokerCard(130,150, face2 );//使用函式
  drawPokerCard(160,200, face3 );//使用函式
  drawPokerCard(190,250, face4 );//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  int W=25;
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#6FF9FF);
  rect(x,y, 150, 250, 20); //弧度
  //fill(0);//黑色的字
  if( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```

## step01-2_為了讓洗牌更合理, 我們打算一步步重新修改程式。首先先能畫出52張牌

```processing
void setup(){
  size(700,700);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){ //迴圈
    int x = (i%10)*60; //除法10餘數,個位數
    int y = int(i/10)*120;//十位數
    rect( x, y, 60,120 );
  }
}
```
其中比較難懂的地方, 是 `int x = (i%10)*60;` 及 `int y = int(i/10)*120;` 這個部分, 使用到取餘數的方法, 得到個位數、十位數。這樣便能讓每個牌的座標合理。

## step02-1_接下來想要把卡片的牌面faces都秀出來, 所以要使用中文字型、要宣告52張牌的版面的陣列, 再把中文字秀出來。

```processing
void setup(){
  size(700,700);
  PFont font = createFont("標楷體", 10);
  textFont(font);
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K" };
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){ //迴圈
    int x = (i%10)*60; //除法10餘數,個位數
    int y = int(i/10)*120;//十位數
    fill(255); rect( x, y, 60, 120 );
    fill(0);   text( faces[i], x+25, y+80);//text( "ID:"+i, x+25, y+80);
  }
}
```

## step02-2_想要讓畫面漂亮一點, 我們做了一些修正, 像是一行改成13張牌, 所以就把取餘數10,改成取餘數13。改一下角色,把座標改一下,把字型改一下,把陣列改一下, 就好了哦

```processing
void setup(){
  size(800,600);
  PFont font = createFont("標楷體", 16);
  textFont(font);
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K" };
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){ //迴圈
    int x = (i%13)*60; //除法10餘數,個位數
    int y = int(i/13)*120;//十位數
    fill(255); rect( x, y, 60, 120 );
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0);
    else fill(255,0,0);
    text( faces[i], x+10, y+60);//text( "ID:"+i, x+25, y+80);
  }
}
```

## step03-1_要用新的洗牌法, 就是亂數決定2張牌, 左手a,右手b, 然後用 temp=a;a=b;b=temp; 的方法做交換。交換很多次後, 牌就會很亂了。

```processing
void setup(){
  size(800,600);
  PFont font = createFont("標楷體", 16);
  textFont(font);
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K" };
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){ //迴圈
    int x = (i%13)*60; //除法10餘數,個位數
    int y = int(i/13)*120;//十位數
    fill(255); rect( x, y, 60, 120 );
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0);
    else fill(255,0,0);
    text( faces[i], x+10, y+60);//text( "ID:"+i, x+25, y+80);
  }
}
void mousePressed(){
  int a = int(random(52));
  int b = int(random(52));
  //目標: faces[a] vs. faces[b] 交換
  String temp = faces[a];
  faces[a] = faces[b];
  faces[b] = temp;
}
```

## step03_2_接下來將 week03-1 與上週的程式結合。以上週的程式為基底(湯底),再加上今天的精華內容, 便能做出(表面上看起來一樣,但)實質上洗牌法不同的程式

```processing
//這個程式,是以 week03-1 當湯底, 加上 week03-5 的 3段小程式 的牛、羊、豬肉 來調味
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
  myShuffle();
}//洗牌的英文 Shuffle
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K" };
void myShuffle(){
  for(int k=0; k<10000; k++){
    int a = int(random(52));
    int b = int(random(52));
    //目標: faces[a] vs. faces[b] 交換
    String temp = faces[a];
    faces[a] = faces[b];
    faces[b] = temp; 
  }
  face1 = faces[0];
  face2 = faces[1];
  face3 = faces[2];
  face4 = faces[3];
}
void mousePressed(){
  myShuffle();
}
String face1, face2, face3, face4;
void draw(){
  drawPokerCard(100,100, face1 );//使用函式
  drawPokerCard(130,150, face2 );//使用函式
  drawPokerCard(160,200, face3 );//使用函式
  drawPokerCard(190,250, face4 );//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  int W=25;
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#6FF9FF);
  rect(x,y, 150, 250, 20); //弧度
  //fill(0);//黑色的字
  if( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```

# Week04

1. 主題1: iPhone 14 動態島的打彈珠/磚塊
2. 主題2: 圍棋

## step01-1_想要做出打磚塊、打彈珠,要使用牛頓定律,首先是靜者恆靜、動者恆動,所以就讓 x += 1 及 y += -1 看到它在動
主題1: 打磚塊

物理學家-牛頓 
靜者恆靜、動者恆動 
x位置, v速度, a加速度

```processing
void setup(){
  size(500,500);
}
int x=250, y=250;//變數(位置)
void draw(){
  ellipse( x, y, 10, 10 );//橢圓
  x = x + 1;
  y = y - 1;
}
```

## step01-2_接下來,利用變數 vx 及 vy 來增加變化, 同時改成float更精細。最後用if判斷,讓它可以撞到牆反彈,也就是速度變成負方向

```processing
void setup(){
  size(500,500);
}
float x=250  , y=250;//變數(位置)精細
float vx=1.0 , vy = -0.5 ;
void draw(){
  ellipse( x, y, 10, 10 );//橢圓
  x = x + vx;
  y = y + vy;
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx; 
}
```

## step01-3_想要碰到board之後反彈,所以寫了一個複雜的if(判斷)

```processing
void setup(){
  size(500,500);
}
float x=250  , y=250;//變數(位置)精細
float vx=2.0 , vy = -1.5 ;
void draw(){
  background(#FFFFF2); //背景,去除殘影
  int boardX = mouseX;
  rect(boardX, 470, 100, 20); //控制的板子
  ellipse( x, y, 10, 10 );//橢圓
  x = x + vx;
  y = y + vy;
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx; 
  if( y>470 && x>boardX && x<boardX+100 ) vy = -vy;
}
```

## step02-1_最後利用 boardX boardY boardW boardH 這些變數,來增加一些變化,並讓判斷可以更有彈性

```processing
void setup(){
  size(500,500);
}
float x=250  , y=250;//變數(位置)精細
float vx=2.0 , vy = -2.5 ;
float boardX, boardY=470, boardW=100, boardH=20;
void draw(){
  boardX = mouseX-boardW/2;
  background(#FFFFF2); //背景,去除殘影
  rect(boardX, boardY, boardW, boardH); //控制的板子
  ellipse( x, y, 10, 10 );//橢圓
  x = x + vx;
  y = y + vy;
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx; 
  if( (y>boardY && y<boardY+boardH) && 
      (x>boardX && x<boardX+boardW) ){
    vy = -vy;
    vx += (mouseX-pmouseX)/2; //mouse的移動速度
  }
  if(mousePressed && mouseButton==LEFT) boardW *= 1.01; //每天多努力 1%
  if(mousePressed && mouseButton==RIGHT) boardW *=0.99; //每天多混 1%
}
```

## step02-2_想要做圍棋,所以先畫出一個棋子,再利用for迴圈,畫出9x9的棋子
主題2: 圍棋

```processing
void setup(){
  size(500,500);
}
void draw(){
  //用迴圈,來畫出很多棋
  for(int x=50; x<=450; x+=50 ){ 
    for(int y=50; y<=450; y+=50 ){
      ellipse(x, y, 50, 50);
    }
  }
}
```

## step02-3_剛剛的迴圈長得很奇怪, 但過程中,讓我們了解x,y座標是怎麼推算出來的。接下來, 我們想要結合for迴圈+陣列,所以利用陣列的值,來把圍棋畫出來。

```processing
void setup(){
  size(500,500);
}
int [][] go ={
  {0,0,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,0,0,1},
  {0,1,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,1,0,1},
  {0,0,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
}; //陣列 array  9x9
void draw(){ //用迴圈,來畫出很多棋
  //background(246, 194, 108);
  for(int i=0; i<9; i++ ){//左手i 對應y座標
    for(int j=0; j<9; j++ ){//右手j 對應x座標
      if( go[i][j]==1) fill(0);
      else fill(255);
      ellipse(50+j*50, 50+i*50, 50, 50);
    }
  }
}
```

## step03-1_畫出棋盤,再利用陣列的值,來決定是黑子、白子
```processing
void setup(){
  size(500,500);
}
int [][] go ={ //0: 沒有棋子, 1:黑棋, 2:白棋
  {0,0,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,0,0,1},
  {0,1,0,0,0,0,0,2,1},
  {0,0,0,0,0,0,1,0,1},
  {0,0,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
}; //陣列 array  9x9
void mousePressed(){
  
}
void draw(){ //用迴圈,來畫出很多棋
  background(246, 194, 108); //木頭色的棋盤
  for(int i=1; i<=9; i++){ //用迴圈,畫很多條線
    line(50, 50*i, 450, 50*i); //湊出來的
    line(50*i, 50, 50*i, 450); //湊出來的
  }
  for(int i=0; i<9; i++ ){//左手i 對應y座標
    for(int j=0; j<9; j++ ){//右手j 對應x座標
      if( go[i][j]==1){
        fill(0); //1:黑棋,
        ellipse(50+j*50, 50+i*50, 40, 40);
      }else if( go[i][j]==2){
        fill(255); //2:白棋
        ellipse(50+j*50, 50+i*50, 40, 40);
      }
    }
  }
}
```

## step03-2_最後圍棋可以利用mousePressed()來算出棋子放在哪裡,再去修改陣列的值。go[i][j]=多少呢 可以利用奇數、偶數,來決定是什麼顏色的棋子
```processing
void setup(){
  size(500,500);
}
int [][] go ={ //0: 沒有棋子, 1:黑棋, 2:白棋
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
}; //陣列 array  9x9
int N=0; //目前有幾個棋子
void mousePressed(){
  int j = (mouseX-25)/50; //右手j, 對應x座標
  int i = (mouseY-25)/50; //左手i, 對應y座標
  go[i][j] = (N%2==0) ? 1 : 2 ;  ///if(N%2==) 用1,否則2
  N++;//多了一個棋子
}
void draw(){ //用迴圈,來畫出很多棋
  background(246, 194, 108); //木頭色的棋盤
  for(int i=1; i<=9; i++){ //用迴圈,畫很多條線
    line(50, 50*i, 450, 50*i); //湊出來的
    line(50*i, 50, 50*i, 450); //湊出來的
  }
  for(int i=0; i<9; i++ ){//左手i 對應y座標
    for(int j=0; j<9; j++ ){//右手j 對應x座標
      if( go[i][j]==1){
        fill(0); //1:黑棋,
        ellipse(50+j*50, 50+i*50, 40, 40);
      }else if( go[i][j]==2){
        fill(255); //2:白棋
        ellipse(50+j*50, 50+i*50, 40, 40);
      }
    }
  }
}
```