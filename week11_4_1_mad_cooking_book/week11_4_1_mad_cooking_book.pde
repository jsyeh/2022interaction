//step02-2_瘋狂做菜_5種料理放不同的素材,有食譜,要照順序做菜
//Step01: 食譜, 畫出食譜 (陣列,順序/色彩、答案)
void setup(){
  size(400,400);
}
int []book={0,1,2,3,4};
color[]bookC={#FA7C7C, #FABB7C, #F7FA7C, #7CFA89, #7C87FA};
void draw(){
  background(#FFFFF2);
  for(int i=0; i<5; i++){
    int c = book[i];
    fill( bookC [c] );
    rect(100, 30+i*30, 100,30);
  }
}
