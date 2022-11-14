//Step01: 畫出牌
//Step02: 把 7放出來
//Step03: 4個花色, 有頭尾
//Step04: 如果是頭尾的鄰居,就可以放上去
void setup() {
  size(500, 400);
  PFont font = createFont("標楷體", 18);
  textFont(font);
}
void draw() {
  background(#FFFFF2);

  for (int s=0; s<4; s++) {
    for (int n=1; n<=13; n++) {
      drawCard(s, n);
    }
  }
}
//0: 黑桃 1: 紅心 2: 方塊 3:梅花
void drawCard(int suit, int number) {
  drawCard(suit, number, 50+suit*100, 10+20*number);
}
void drawCard(int suit, int number, int x, int y) {
  String [] suits={"黑桃", "紅心", "方塊", "梅花"};
  String [] AJQK = {"0", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"};
  fill(255);
  rect(x, y, 80, 120);
  if (suit==0 || suit==3) fill(0);
  else fill(255, 0, 0);
  text(suits[suit] + AJQK[number], x+25, y+18);
}
