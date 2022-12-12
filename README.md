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


# Week05
1. 主題: 象棋暗棋
2. 主題: 記憶卡片遊戲 (圖片)

## step01-1_想做象棋,先畫出棋盤。因棋盤有很多直線、橫線,所在刻線時,要確認它們的座標,剛好座標呈等差級數,所以數字寫出來,迴圈就可以寫出來了
```processing
//畫棋盤
//等差級數: 50,100,150,200,250,300,350,400,450
//  for(int x=50; x<=450; x+=50)
size(500,550);
for(int x=50; x<=450; x+=50){
  //line( x, 50, x, 500 );
  line( x, 50, x, 250);
  line( x, 300, x, 500);
}
//10條
for(int y=50; y<=500; y+=50){
  line( 50, y, 450, y);
}
```
## step01-2_接下來想畫棋子, 所以用上週學過的陣列,配合迴圈來畫出來,先用數字試看看,確認對應正確
```processing
//畫棋子 (要下棋,要互動)
int [][]board={
  {4,5,3,2,1,2,3,5,4},
  {0,0,0,0,0,0,0,0,0},
  {0,6,0,0,0,0,0,0,0},
  {7,0,7,0,7,0,7,0,7},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
void setup() {
  size(500, 550);
}
void draw() {
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for(int i=0; i<4; i++){
    for(int j=0; j<9; j++){
      text( board[i][j], 50+j*50, 50+i*50);
    }
  }
}
```
## step01-3_想要畫出中文字的棋子,就要有中文字型,而且也要利用陣列,把board[i][j]換算成中文字串
```processing
//畫棋子 (要下棋,要互動)
int [][]board={
  {4,5,3,2,1,2,3,5,4},
  {0,0,0,0,0,0,0,0,0},
  {0,6,0,0,0,0,0,0,0},
  {7,0,7,0,7,0,7,0,7},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name = {"將","士","象","車","馬","包","卒"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for(int i=0; i<4; i++){
    for(int j=0; j<9; j++){
      int id = board[i][j]; //1開始
      if(id==0) continue; //陣列請回去(繼續)
      text( name[id-1], 50+j*50, 50+i*50);
    }
  }
}
```

## step02-1_棋子有黑色、紅色,所以可以利用正數、負數,來代表不同的棋子,0代表沒有棋子。把陣列寫得更完整,把畫圖的迴圈對應放大,便能畫出完整棋盤上的棋子
```processing
//畫棋子 (要下棋,要互動)
int [][]board={
  {4, 5, 3, 2, 1, 2, 3, 5, 4},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 6, 0, 0, 0, 0, 0, 6, 0},
  {7, 0, 7, 0, 7, 0, 7, 0, 7},
  {0, 0, 0, 0, 0, 0, 0, 0, 0}, //上面是黑色
  {0, 0, 0, 0, 0, 0, 0, 0, 0}, //下面是紅色
  {-7, 0,-7, 0,-7, 0,-7, 0,-7},
  {-0,-6, 0, 0, 0, 0, 0,-6, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4,-5,-3,-2,-1,-2,-3,-5,-4},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      int id = board[i][j]; //1開始
      if (id==0) continue; //陣列請回去(繼續)
      if (id>0){
        fill(255);
        ellipse( 50+j*50, 50+i*50, 40, 40);
        fill(0);
        text( name[id-1], 50+j*50, 50+i*50-3);
      }else if(id<0){
        fill(255);
        ellipse( 50+j*50, 50+i*50, 40, 40);
        fill(255,0,0);
        text( name2[-id-1], 50+j*50, 50+i*50-3);        
      }
    }
  }
}
```

## step02-2_加上mousePressed的互動,去看看mouseX,mouseY與哪一個棋子最接近,便能夠設定棋子
```processing
//畫棋子 (要下棋,要互動)
int [][]board={
  {4, 5, 3, 2, 1, 2, 3, 5, 4},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 6, 0, 0, 0, 0, 0, 6, 0},
  {7, 0, 7, 0, 7, 0, 7, 0, 7},
  {0, 0, 0, 0, 0, 0, 0, 0, 0}, //上面是黑色
  {0, 0, 0, 0, 0, 0, 0, 0, 0}, //下面是紅色
  {-7, 0,-7, 0,-7, 0,-7, 0,-7},
  {-0,-6, 0, 0, 0, 0, 0,-6, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4,-5,-3,-2,-1,-2,-3,-5,-4},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      int id = board[i][j]; //1開始
      if (id==0) continue; //陣列請回去(繼續)
      if (id>0){
        fill(255);
        ellipse( 50+j*50, 50+i*50, 40, 40);
        fill(0);
        text( name[id-1], 50+j*50, 50+i*50-3);
      }else if(id<0){
        fill(255);
        ellipse( 50+j*50, 50+i*50, 40, 40);
        fill(255,0,0);
        text( name2[-id-1], 50+j*50, 50+i*50-3);        
      }
    }
  }
}
void mousePressed(){
  for(int i=0; i<10; i++){
    for(int j=0; j<9; j++){
      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){
        board[i][j]=1;
      }
    }
  }
}
```

## step02-3_要移動棋子時,mousePressed要把棋子拿到手上, mouseReleased時把棋子放下去
```processing
//畫棋子 (要下棋,要互動)
int [][]board={
  { 4, 5, 3, 2, 1, 2, 3, 5, 4},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 6, 0, 0, 0, 0, 0, 6, 0},
  { 7, 0, 7, 0, 7, 0, 7, 0, 7},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0}, //上面是黑色
  { 0, 0, 0, 0, 0, 0, 0, 0, 0}, //下面是紅色
  {-7, 0,-7, 0,-7, 0,-7, 0,-7},
  {-0,-6, 0, 0, 0, 0, 0,-6, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4,-5,-3,-2,-1,-2,-3,-5,-4},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      int id = board[i][j]; //1開始
      if (id==0) continue; //陣列請回去(繼續)
      if (id>0){
        fill(255);
        ellipse( 50+j*50, 50+i*50, 40, 40);
        fill(0);
        text( name[id-1], 50+j*50, 50+i*50-3);
      }else if(id<0){
        fill(255);
        ellipse( 50+j*50, 50+i*50, 40, 40);
        fill(255,0,0);
        text( name2[-id-1], 50+j*50, 50+i*50-3);        
      }
    }
  }
  if(handChess!=0) ellipse(mouseX,mouseY,40,40);
}
int handChess=0;
void mousePressed(){
  for(int i=0; i<10; i++){
    for(int j=0; j<9; j++){
      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){
        handChess = board[i][j];
        board[i][j] = 0;//棋盤上的棋子不見了
      }//把那個棋子,拿在手上
    }
  }
}
void mouseReleased(){    //另一種四捨五入
  int i = (mouseY+25-50)/50;//y是50+i*50
  int j = (mouseX+25-50)/50;//x是50+j*50
  board[i][j] = handChess;//手上的棋子放到棋盤
  handChess = 0; //手上的棋子 清空
}
```

## step03-1_想要讓程式碼更好,所以利用drawChess()函式,來專心畫棋子,便能將手上的棋子也畫出來
```processing
int [][]board={
  { 4, 5, 3, 2, 1, 2, 3, 5, 4},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 6, 0, 0, 0, 0, 0, 6, 0},
  { 7, 0, 7, 0, 7, 0, 7, 0, 7},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0}, //上面是黑色
  { 0, 0, 0, 0, 0, 0, 0, 0, 0}, //下面是紅色
  {-7, 0,-7, 0,-7, 0,-7, 0,-7},
  {-0,-6, 0, 0, 0, 0, 0,-6, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4,-5,-3,-2,-1,-2,-3,-5,-4},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      int id = board[i][j]; //1開始
      if (id==0) continue; //陣列請回去(繼續)
      drawChess(50+j*50, 50+i*50, id);
    }
  }
  if(handChess!=0) drawChess(mouseX,mouseY,handChess);
}
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
int handChess=0;
void mousePressed(){
  for(int i=0; i<10; i++){
    for(int j=0; j<9; j++){
      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){
        handChess = board[i][j];
        board[i][j] = 0;//棋盤上的棋子不見了
      }//把那個棋子,拿在手上
    }
  }
}
void mouseReleased(){    //另一種四捨五入
  int i = (mouseY+25-50)/50;//y是50+i*50
  int j = (mouseX+25-50)/50;//x是50+j*50
  board[i][j] = handChess;//手上的棋子放到棋盤
  handChess = 0; //手上的棋子 清空
}
```

## step03-2_想要做出暗棋,所以要先改變陣列,並把棋子都放進4x8的格子中。增加中文字型,再利用今天寫的程式來drawChess()
```processing
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      int id = board[i][j];
      drawChess(50+25+j*50, 50+25+i*50, id);
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name2[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```

## step03-3_今天最後一節教得太快了, 所以再複習一次怎麼做暗棋,再加上翻棋的功能
```processing
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
}
void mousePressed(){
  for(int i=0; i<10; i++){
    for(int j=0; j<9; j++){
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        //之後再加棋子的移動
      }
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name2[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```

# Week07
1. 複習象棋暗棋(缺亂數shuffle)
2. 記憶卡片遊戲
3. 打字遊戲、水果忍者/鍵盤忍者

## step01-1_今天的第1個目標,是把上次上課時, 象棋暗棋做完。但上次沒有把暗棋的位置弄亂, 所以接續上週的程式, 先把有錯的程式, 像是紅色、黑色的字弄對name[i][j] vs. name2[i][j]。還有 for迴圈的範圍弄對。接下來, 利用 for迴圈跑1000次, 亂數決定 i1,j1 及 i2,j2 以便做棋子的交換,便完成洗牌。


```processing
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0; k<1000; k++){ //很多次洗牌1000次
    int i1= int(random(4)), j1=int(random(8));
    int i2= int(random(4)), j2=int(random(8));
    int temp= board[i1][j1];
    board[i1][j1]=board[i2][j2];
    board[i2][j2]=temp;
  } //這個迴圈是新加的暗棋的洗牌
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
}
void mousePressed(){
  for(int i=0; i<4; i++){ //10 這是錯的,要改成 4
    for(int j=0; j<8; j++){ //9 這是錯的,要改成 8
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        //之後再加棋子的移動
      }
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);///之前老師的程式有錯哦!!!!
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```

## step01-2_想要讓棋子可以移動,應該要先能選棋子,所以我們用綠色,來標示我們要移動的棋子

```processing
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0; k<1000; k++){ //很多次洗牌1000次
    shuffle_one();
  } //這個迴圈是新加的暗棋的洗牌
}
void shuffle_one(){
  int i1= int(random(4)), j1=int(random(8));
  int i2= int(random(4)), j2=int(random(8));
  int temp= board[i1][j1];
  board[i1][j1]=board[i2][j2];
  board[i2][j2]=temp;  
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
  if(moving){
    drawChess(50+25+moveJ*50, 50+25+moveI*50, 9); ///9很怪
  }
}
int moveI = -1, moveJ = -1;
boolean moving = false; //不是移動中
void mousePressed(){
  for(int i=0; i<4; i++){ //10 這是錯的,要改成 4
    for(int j=0; j<8; j++){ //9 這是錯的,要改成 8
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        else {
          moveI = i; //我們想移動的棋子 i座標
          moveJ = j; //我們想移動的棋子 j座標
          moving = true; //現在移動中
        }//現在要加棋子的移動
      }
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id==9){//待移動中的棋子
      fill(0,255,0);//綠色
      ellipse( x, y, 40, 40);
    }else if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);///之前老師的程式有錯哦!!!!
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```


## step02-1_想要移動棋子時, 需要先確定誰要被移動。之前是用全綠去畫棋子,其實不太好。所以, 我們改成2步驟, (1) 改用 fill(0,255,0, 128) 半透明的綠色圓,蓋在棋子上, (2) 利用 moveID 來畫那個隨著mouse移動、手正持著的棋子

```processing
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0; k<1000; k++){ //很多次洗牌1000次
    shuffle_one();
  } //這個迴圈是新加的暗棋的洗牌
}
void shuffle_one(){
  int i1= int(random(4)), j1=int(random(8));
  int i2= int(random(4)), j2=int(random(8));
  int temp= board[i1][j1];
  board[i1][j1]=board[i2][j2];
  board[i2][j2]=temp;  
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
  if(moving){
    fill(0,255,0, 128); //綠色, 半透明
    ellipse(50+25+moveJ*50, 50+25+moveI*50, 40,40);//原來的位置
    
    drawChess(mouseX, mouseY, moveID); //正在飛行、移動的棋子
  }
}
int moveI = -1, moveJ = -1, moveID = -1;
boolean moving = false; //不是移動中
void mousePressed(){//按下去,準備要吃
  for(int i=0; i<4; i++){ //10 這是錯的,要改成 4
    for(int j=0; j<8; j++){ //9 這是錯的,要改成 8
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        else {
          moveI = i; //我們想移動的棋子 i座標
          moveJ = j; //我們想移動的棋子 j座標
          moveID = board[i][j];
          moving = true; //現在移動中
        }//現在要加棋子的移動
      }
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    //if(id==9){//待移動中的棋子
    //  fill(0,255,0);//綠色
    //  ellipse( x, y, 40, 40);
    //}else 
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);///之前老師的程式有錯哦!!!!
    } else {//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```

## step02-2_在moving時,mouseReleased()時,要把棋子移動過去, 也就是先把原本位置 board[moveI][moveJ] 清空,再把 board[i][j]=moveID, 便能做出移動棋子的效果。另外要小心,如果drawChess()時,如果id是0表示是空的,便不要畫它哦

```processing
int [][]show={
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0}
};//翻牌前, 0 都不會秀哦! 
int [][]board={
  { 1, 2, 2, 3, 3, 4, 4, 5},
  { 5, 6, 6, 7, 7, 7, 7, 7},
  {-1,-2,-2,-3,-3,-4,-4,-5},
  {-5,-6,-6,-7,-7,-7,-7,-7}
}; //暗棋的格子,比較少 4x8=32個棋子
void setup(){
  size(500,300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0; k<1000; k++){ //很多次洗牌1000次
    shuffle_one();
  } //這個迴圈是新加的暗棋的洗牌
}
void shuffle_one(){
  int i1= int(random(4)), j1=int(random(8));
  int i2= int(random(4)), j2=int(random(8));
  int temp= board[i1][j1];
  board[i1][j1]=board[i2][j2];
  board[i2][j2]=temp;  
}
void draw(){
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) {
    line( 50, y, 450, y);
  }  
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(show[i][j]==0){
        fill(255);
        ellipse( 50+25+j*50, 50+25+i*50, 40, 40);        
      }else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
  if(moving){
    fill(0,255,0, 128); //綠色, 半透明
    ellipse(50+25+moveJ*50, 50+25+moveI*50, 40,40);//原來的位置
    
    drawChess(mouseX, mouseY, moveID); //正在飛行、移動的棋子
  }
}
int moveI = -1, moveJ = -1, moveID = -1;
boolean moving = false; //不是移動中
void mousePressed(){//按下去,準備要吃
  for(int i=0; i<4; i++){ //10 這是錯的,要改成 4
    for(int j=0; j<8; j++){ //9 這是錯的,要改成 8
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( show[i][j]==0 ) show[i][j] = 1; //沒秀? 秀它
        else {
          moveI = i; //我們想移動的棋子 i座標
          moveJ = j; //我們想移動的棋子 j座標
          moveID = board[i][j];
          moving = true; //現在移動中
        }//現在要加棋子的移動
      }
    }
  }
}
void mouseReleased(){//放開時,就把「它」吃掉
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      if(dist(mouseX,mouseY,50+25+j*50,50+25+i*50)<20){
        if( moving ){
          board[moveI][moveJ]=0;
          board[i][j]=moveID;
          moving = false;
        }
      }
    }
  }
}
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void drawChess(int x, int y, int id){
    if(id==0) return; //沒有棋子,就不要進來
    fill(255);
    ellipse( x, y, 40, 40);
    //if(id==9){//待移動中的棋子
    //  fill(0,255,0);//綠色
    //  ellipse( x, y, 40, 40);
    //}else 
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);///之前老師的程式有錯哦!!!!
    } else {//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
```

## step03-1_想要播放音樂,先從 keyboard ninja 網頁下載它的音樂素材 mp3 檔。接著在 Processing-Sketch-Libraries-Manage Libraries裡,找到Sound並且下載。最後在程式中, import完之後, 使用 SoundFile 物件,便能play播放它


- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/app.min.446.js

可以在它的程式裡, 找到許多 mp3 檔, 類以以下網址
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Intro%20Song_Final.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/In%20Game%20Music.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/SparkSFX.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Fruit%20Missed.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Cannon%20Blast.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Monkey%201.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Monkey%202.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Monkey%203.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Monkey%204.mp3
- https://www.typing.com/dist/student/extras/game_files/keyboard-ninja/sounds/Gong.mp3

把你的程式存新的檔案 week07_3
把下載的 mp3 檔, 拉到程式碼, 便會將檔案 copy 到你的專案目錄中。

```processing
//存檔, mp3拉近來, Ctrl-K看檔案
import processing.sound.*; //音樂功能 
//使用外掛, 要先把外掛裝起來!!!!

void setup(){
  SoundFile file = new SoundFile(this, "Intro Song_Final.mp3");
  file.play();
}
void draw(){
  
}
void mousePressed(){
  SoundFile file2 = new SoundFile(this, "In Game Music.mp3");
  file2.play();
}
```

## step03-2_如果音樂檔案很多,應該要在外面宣告SoundFile變數, 在 setup()裡把它們準備好, 然後重覆使用這些變數

```processing
//存檔, mp3拉近來, Ctrl-K看檔案
import processing.sound.*; //音樂功能 
//使用外掛, 要先把外掛裝起來!!!! 
// Sketch-Library-Manage Libraries, 找 Sound 再裝它
SoundFile file1, file2, file3, file4;
void setup(){
  file1 = new SoundFile(this, "Intro Song_Final.mp3");
  file2 = new SoundFile(this, "In Game Music.mp3");
  file3 = new SoundFile(this, "Monkey 1.mp3");
  file4 = new SoundFile(this, "Fruit Missed.mp3");
  
  file1.play();
}
void draw(){
  
}
void mousePressed(){
  file2.play();
}
void keyPressed(){
  file3.play();
}
```

# Week08

## step01-0_介紹今天要上課的主題
1. 接續上週的鍵盤忍者
2. 金鐘獎頒獎時, 有個倒數計時的畫面, 很想做做看
3. 期中成績會看blog, 期中作品有1個月的時間, 期末作品也約1個月

## step01-1_接續上週的SoundFile播放音樂, 先寫出最精簡的程式, 再改成2個音樂,在不同的場景中輪流播放。

```processing
//(0) 先照Moodle在網路下載 mp3檔
//(1) 安裝 Sketch-Library-Manage Libraries 裝 Sound
import processing.sound.*;
SoundFile sound1, sound2, sound3;
//(2) 程式存檔, 把音樂檔拉進來
void setup(){
  size(400,300);
  sound1 = new SoundFile(this, "In Game Music.mp3");
  sound1.play();
}
void draw(){
  
}
```

## step01-2_再改成2個音樂,在不同的場景中輪流播放。

```processing
import processing.sound.*;
SoundFile sound1, sound2, sound3;
//(2) 程式存檔, 把音樂檔拉進來
void setup(){
  size(400,300);
  textSize(50);
  fill(255,0,0);
  sound1 = new SoundFile(this, "In Game Music.mp3");
  sound2 = new SoundFile(this, "Intro Song_Final.mp3");
  sound1.play();
}
int stage=1;//1, 2, 3
void draw(){
  background(255);
  if(stage==1){ //舞台1
    text("stage 1", 100,100);
  }else if(stage==2){ //舞台2
    text("stage 2", 100,100);
  }
}
void mousePressed(){
  if(stage==1){ //
    stage=2;
    sound1.stop();
    sound2.play();
  }else if(stage==2){
    stage=1;
    sound2.stop();
    sound1.play();
  }
}
```

## step01-3_因為有同學在step01-2實作有卡住, 所以利用簡化的程式,示範如何利用 int stage 這個整數, 來決定是在第幾關、第幾個舞台

```processing
void setup(){
  size(400,300);
}
int stage=1;//1:start, 2:playing
void draw(){
  background(255,255,0);
  fill(255,0,0);
  textSize(80);
  if(stage==1){
    text("stage 1", 100,100);
  }else if(stage==2){
    text("stage 2", 100,100);
  }
}
void mousePressed(){
  if(stage==1) stage=2;
  else if(stage==2) stage=1;
}
```

## step02-1_為了做出水果忍者、鍵盤忍者裡,會飛的水果,所以利用fruitX, fruitY, fruitVX, fruitVY 來調整水果的位置, 並用 flying 變數,來決定水果是不是在飛

```processing
//目標: 有個水果可以飛起來!!!
//按按鍵,可以把它消掉
void setup(){
  size(400,300);
}
float fruitX=200, fruitY=300;//水果的位置 X Y有小數點,精確
float fruitVX=2, fruitVY=-13;///水果的速度 VX VY
boolean flying=true; //if()好朋友,布林變數 true false 成立 不成立
void draw(){
  background(255,255,0);//黃色的背景
  
  ellipse(fruitX, fruitY, 50,50);
  if(flying){//如果在飛,水果的位置會改變
    fruitX += fruitVX;
    fruitY += fruitVY;
    fruitVY += 0.98/3;//重力加速度
  }
}
void keyPressed(){
  flying=false;
}
```

## step02-2_增加 fruitReset()的函式, 會幫忙將 fruit 的狀態reset, 變成另一個重新丟出來的水果

```processing
//目標: 有個水果可以飛起來!!!
//按按鍵,可以把它消掉
void setup(){
  size(400,300);
}
float fruitX=200, fruitY=300;//水果的位置 X Y有小數點,精確
float fruitVX=2, fruitVY=-13;///水果的速度 VX VY
boolean flying=true; //if()好朋友,布林變數 true false 成立 不成立
void draw(){
  background(255,255,0);//黃色的背景
  
  ellipse(fruitX, fruitY, 50,50);
  if(flying){//如果在飛,水果的位置會改變
    fruitX += fruitVX;
    fruitY += fruitVY;
    fruitVY += 0.98/3;//重力加速度
  }
}
void keyPressed(){
  flying=false;
  fruitReset(); ///重新準備另一發水果
}
void fruitReset(){
  fruitX=random(100,300);
  fruitY=300;//固定高度
  fruitVX=random(-2,+2);
  fruitVY=-13;
  flying=true;  
}
```

## step03-1_利用class物件,將前一個程式改寫,以便之後做出更多的水果

```processing
//目標: class物件: 每個水果都可以用物件生出來(值、函式)
class Fruit{
  float x, y, vx, vy;
  boolean flying;
  PApplet sketch;//為了讓random可以用,修改一下
  Fruit(PApplet _sketch){ //建構子: 一開始要做的事
    sketch = _sketch;//為了讓random可以用,修改一下
    reset();
  }
  void reset(){
    x = sketch.random(100.0, 300.0);//為了讓random可以用,修改一下
    y = 300;
    vx = sketch.random(-2,+2);//為了讓random可以用,修改一下
    vy = -13;
    flying = true;
  }
  void update(){
    x += vx;
    y += vy;
    vy += 0.98/3;//重力加速度    
  }
}
Fruit fruit;
void setup(){
  size(400,300);
  fruit = new Fruit(this);//為了讓random可以用,修改一下
}
void draw(){
  background(255,255,0);
  ellipse(fruit.x, fruit.y, 50, 50);
  fruit.update();
}
void keyPressed(){
  fruit.reset();
}
```

## step03-2_將class物件的程式分到另一個tab分頁後,程式碼會變得很容易看、容易管理。我們讓每個水果上面畫個字母, 再利用陣列來畫出來, 便能做出很多水果的版本

```processing
Fruit [] fruits;
void setup(){
  size(400,300);
  fruits = new Fruit[3];
  for(int i=0; i<3; i++){
    fruits[i] = new Fruit(this);//為了讓random可以用,修改一下
  }
}
void draw(){
  background(255,255,0);
  for(int i=0; i<3; i++){
    fill(255); ellipse(fruits[i].x, fruits[i].y, 50, 50);
    textSize(30); 
    textAlign(CENTER,CENTER);
    fill(0); text(fruits[i].c, fruits[i].x, fruits[i].y);
    fruits[i].update();
  }
}
void keyPressed(){
  for(int i=0; i<3; i++){
    if( keyCode == fruits[i].c ){
      fruits[i].reset();
    }
  }
}
```

另一個程式檔 Fruit.pde

```processing
//目標: class物件: 每個水果都可以用物件生出來(值、函式)
String line="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
class Fruit{
  float x, y, vx, vy;
  boolean flying;
  char c;//水果對應的字母
  PApplet sketch;//為了讓random可以用,修改一下
  Fruit(PApplet _sketch){ //建構子: 一開始要做的事
    sketch = _sketch;//為了讓random可以用,修改一下
    reset();
  }
  void reset(){
    x = sketch.random(100.0, 300.0);//為了讓random可以用,修改一下
    y = 300;
    vx = sketch.random(-2,+2);//為了讓random可以用,修改一下
    vy = -13;
    flying = true;
    int i=int(random(26));
    c = line.charAt(i);
  }
  void update(){
    x += vx;
    y += vy;
    vy += 0.98/3;//重力加速度    
  }
}
```


## step03-3_讓水果跳起來更有亂數的感覺,所以加上delay並讓超過畫面的水果重生

只修改 Fruit.pde 程式
```processing
//目標: class物件: 每個水果都可以用物件生出來(值、函式)
String line="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
class Fruit{
  float x, y, vx, vy;
  boolean flying;
  int delay;
  char c;//水果對應的字母
  PApplet sketch;//為了讓random可以用,修改一下
  Fruit(PApplet _sketch){ //建構子: 一開始要做的事
    sketch = _sketch;//為了讓random可以用,修改一下
    reset();
  }
  void reset(){
    x = sketch.random(100.0, 300.0);//為了讓random可以用,修改一下
    y = 300;
    vx = sketch.random(-2,+2);//為了讓random可以用,修改一下
    vy = -13;
    flying = true;
    delay = int(random(150));
    int i=int(random(26));
    c = line.charAt(i);
  }
  void update(){
    if(delay>0){
      delay--;
      return;
    }
    x += vx;
    y += vy;
    vy += 0.98/3;//重力加速度    
    if(y>300) reset();
  }
}
```

# Week10

## step01-1_解釋期中成績計算方式

## step01-2_示範爆爆王

## step02-1_示範射擊遊戲_彈幕_很多子彈_很多敵人

## step02-2_示範貓狗大戰、射擊角度

## step03-1_畫線_畫出橋_建出線條的模型

## step03-2_撞球_射擊撞球_旋轉_入射角_反射角_碰撞

以下是循序漸進,解釋到底「碰撞反彈」要怎麼做 

撞到下邊界時反彈, 簡單易理解

![image](https://user-images.githubusercontent.com/3252557/200377358-11320e4a-3bcd-4266-8cb8-971980ed1dd6.png)

```processing
float vx=1, vy=1.3;
float x=50, y=100;
void setup(){
  size(300,200);
}
void draw(){
  ellipse(x,y,3,3);
  x += vx;
  y += vy;
  if( y > 200){
    vy = - vy;
  }
}
```

修改成, 撞到右邊界時反彈, 簡單易理解
```processing
float vx=1, vy=1.3;
float x=50, y=100;
void setup(){
  size(100,300);
}
void draw(){
  ellipse(x,y,3,3);
  x += vx;
  y += vy;
  if( x > 100){
    //vy = - vy;
    vx = - vx;
  }
}
```

接下來, 改利用PVector的向量運算, 能不能用內積來做到呢?

![image](https://user-images.githubusercontent.com/3252557/200377257-e8be2c82-eeba-492b-a1b9-4ea4b9c47d4c.png)


```processing
PVector v ;//float vx=1, vy=1.3;
PVector p ;//float x=50, y=100;
PVector n ;
void setup(){
  size(400,300);
  v = new PVector(  1, 1.3);
  p = new PVector( 50, 100);
  n = new PVector( -1, 0);//法向量
}
void draw(){
  ellipse(p.x,p.y,3,3);
  p.add(v); //x += vx; y += vy;
  if( p.x >= 100){
    //vx = - vx;
    float green = PVector.dot(v, n);
    PVector v2 = PVector.mult(n, -green * 2);
    v.add(v2);
  }
}
```

再做另一個方向類似的修改

```processing
PVector v ;//float vx=1, vy=1.3;
PVector p ;//float x=50, y=100;
PVector n ;
void setup(){
  size(300,200);
  v = new PVector(  1, 1.3);
  p = new PVector( 50, 100);
  n = new PVector( 0, -1);//法向量,向上
}
void draw(){
  ellipse(p.x,p.y,3,3);
  p.add(v); //x += vx; y += vy;
  if( p.y >= 200){
    //vx = - vx;
    float green = PVector.dot(v, n);
    PVector v2 = PVector.mult(n, -green * 2);
    v.add(v2);
  }
}
```

上面共通的核心程式, 就是內積 dot() 之後, 修正 v 向量。所以試著亂改一下法向量

```processing
PVector v ;//float vx=1, vy=1.3;
PVector p ;//float x=50, y=100;
PVector n ;
void setup(){
  size(300,200);
  v = new PVector(  1, 1.3);
  p = new PVector( 50, 100);
  n = new PVector( -1, -1).normalize();//單位法向量
}
void draw(){
  ellipse(p.x,p.y,3,3);
  p.add(v); //x += vx; y += vy;
  if( p.y >= 200){
    //vx = - vx;
    float green = PVector.dot(v, n);
    PVector v2 = PVector.mult(n, -green * 2);
    v.add(v2);
  }
}
```

最後, 便可以做出 點p 與球的碰撞

```processing
PVector v ;//float vx=1, vy=1.3;
PVector p ;//float x=50, y=100;
void setup(){
  size(500,500);
  v = new PVector(  1, 1.3);
  p = new PVector( 50, 60);
  frameRate(10);
}
void draw(){
  background(#FFFFF2);
  ellipse(p.x,p.y,3,3);
  p.add(v); //x += vx; y += vy;
  ellipse(mouseX,mouseY,150,150);
  if( dist(p.x,p.y, mouseX,mouseY)<75 ){
    //vx = - vx;
    PVector c = new PVector(mouseX,mouseY);
    PVector n = PVector.sub(p,c).normalize();//單位法向量
    float green = PVector.dot(v, n);
    PVector v2 = PVector.mult(n, -green * 2);
    v.add(v2);
    line(c.x, c.y, p.x, p.y);
  }
}
```

最後, 修改成 球跟球的碰撞

```processing
PVector v ;//float vx=1, vy=1.3;
PVector p ;//float x=50, y=100;
void setup(){
  size(500,500);
  v = new PVector(  1, 1.3);
  p = new PVector( 50, 60);
  frameRate(10);
}
void draw(){
  background(#FFFFF2);
  ellipse(p.x,p.y,100,100);
  p.add(v); //x += vx; y += vy;
  ellipse(mouseX,mouseY,100,100);
  if( dist(p.x,p.y, mouseX,mouseY)<100){
    //vx = - vx;
    PVector c = new PVector(mouseX,mouseY);
    PVector n = PVector.sub(p,c).normalize();//單位法向量
    float green = PVector.dot(v, n);
    PVector v2 = PVector.mult(n, -green * 2);
    v.add(v2);
    line(c.x, c.y, p.x, p.y);
  }
}
```

# Week11

## step01-1_爆爆王怎麼做出爆炸的效果、怎麼爆炸後留下殘餘的色彩

## step01-2_hex_六角形的地圖.


## step02-1_poker_seven_牌七

## step02-2_瘋狂做菜_5種料理放不同的素材,有食譜,要照順序做菜

## step02-3_瘋狂做菜_比對食譜

## step03-1_太鼓達人

## step03-2_拼圖

# Week12

## week12_1卡片交換

## week12-2_network_client_server

## week12_3_pixels_walk

## week12_4_minesweeper

## week12-5_移動黑洞,並吃周圍的物體

## week12-6_每五秒出現一個可以加分的物體

## week12-7_泡泡龍會黏住,再示範一次

## week12-8_很長的背景

## week12-9_模仿Chrome裡的恐龍跳跳跳

# Week13

## week13_1_music_game_bonus_effect

## week13_1_2_music_game_bonus_effect

## week13_2_invis_map


# Week14

## week14_1_1_domino_one_rect

## week14_1_2_domino_two_rect

## week14_1_3_domino_random_x_y_n1_n2

## week14_1_4_domino_class_version

## week14_1_5_domino_class_d1_d2

## week14_1_6_domino_array_two

## week14_1_7_domino_array_N

## week14_1_8_domino_mouseDragged_move_one

## week14_1_9_domino_mousePressed_RIGHT_swap

## week14_2_puzzle_shape_image_mask


# Week15

## step01-1_老師示範昨天寫的lightbot程式

## step01-2_同學問如何採地雷的擴散展開myOpen()

## step04-1_如何同時按很多按鍵

## step04-2_如何讀進很多張圖,當成是按鈕的處理

## step04-3_同學問怎麼做出撞球的擊球操作_進洞等,配合圖片來完成