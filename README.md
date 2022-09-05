# 2022互動技術

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