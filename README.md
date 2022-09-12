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

