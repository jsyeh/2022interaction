# 2022互動技術

## step01-1_簡介、解壓縮

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
- processing to p5.js 的網頁 - https://pde2js.herokuapp.com 
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