import java.util.Map;
class SubTexture {
  String name;
  int x, y, w, h;
  PImage img;
  SubTexture(XML child, PImage all) {
    name = child.getString("name");
    x = child.getInt("x");
    y = child.getInt("y");
    w = child.getInt("width");
    h = child.getInt("height");
    img = all.get(x, y, w, h);
  }
  void draw(int x0, int y0) {
    image(img, x0, y0);
  }
  void draw(int x0, int y0, float scale) {
    image(img, x0, y0, w*scale, h*scale);
  }
  void drawBottom(int x0, int y0, float scale) {
    image(img, x0, y0-h*scale, w*scale, h*scale);
  }
  void drawCenter(int x0, int y0, float scale) {
    imageMode(CENTER);
    image(img, x0, y0, w*scale, h*scale);
    imageMode(CORNER);
  }
  void print() {
    println(name, x, y, w, h);
  }
}
class Texture {
  HashMap<String, SubTexture> table;  // hash table
  String [] names;
  PImage img;

  public Texture(String pngfile, String xmlfile) {
    img = loadImage(pngfile);
    table = new HashMap<String, SubTexture>();
    XML xml = loadXML(xmlfile);
    XML [] children = xml.getChildren("SubTexture");

    names = new String[children.length];
    for (int i=0; i<children.length; i++) {
      XML child = children[i];
      names[i] = child.getString("name");

      SubTexture tex = new SubTexture(child, img);
      table.put(tex.name, tex);  // build the hash table
      tex.print();  // list all children in XML
    }
  }

  SubTexture get(String name) {
    return table.get(name);
  }

  SubTexture get(int i) {
    return table.get(names[i]);
  }
}

Texture texBG, texBoyGirl, texInGame;

void setup() {
  size(1024, 768);
  texBG = new Texture("backgrounds_4x.png", "backgrounds_4x.xml");
  texBoyGirl = new Texture("boygirl_4x.png", "boygirl_4x.xml");
  texInGame = new Texture("ingame_4x.png", "ingame_4x.xml");

  testingTex = texInGame;  // for viewing testing SubTexture
}

Texture testingTex;  // for viewing testing SubTexture
int testingID = 0;  // for viewing testing SubTexture

int state = 0; //0: show_levelsets(), 1: show sets, 2: show game
void draw() {
  if (state==0) show_levelsets();
  if (state==2) show_game();

  testingTex.get(testingID).draw(8, 8, 0.5);  // for viewing testing SubTexture
}

void draw_game_map(int levelN) {
  String [] level = {"1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8",
    "2-1", "2-2", "2-3", "2-4", "2-5", "2-6",
    "3-1", "3-2", "3-3", "3-4", "3-5", "3-6"};
  fill(0);
  textSize(36);
  text( level[levelN], 22, 290 );

  stroke(0);
  noFill();
  int [][] map2 = gameMap[levelN];
  int [] pos = map2[map2.length-1];
  for (int i=0; i<map2.length-1; i++) {
    int [] map3 = map2[i];
    for (int j=0; j<map3.length; j++) {
      //texInGame.get("tile0001").drawBottom(248, 405+64, 0.5);  // 1-1座標供參考
      //texInGame.get("tile0001").drawBottom(293, 428+64, 0.5);  // 1-1座標供參考
      //texInGame.get("tile0006").drawBottom(293+45, 428+23+64, 0.5);  // 1-1座標供參考
      int x = magicX(map2, i, j), y = magicY(map2, i, j);  // 神奇的座標計算，之後可能會改
      if (map3[j]==0) continue;

      String tile = "tile000";
      if (map3[j]>0) tile += map3[j];
      if (map3[j]<0) tile += (-map3[j])+5;
      if (map3[j]==5) tile = "tile0010";  // 前項 map3[j]==-5 會出錯，改為 "tile0010"
      texInGame.get(tile).drawBottom(x, y, 0.5);

      if (i == pos[0] && j == pos[1]) draw_bot(pos[0], pos[1], pos[2], map2);  // 迴圈裡畫bot，會正確遮蔽
    }
  }

  boolean show_simple = false;  // for debugging
  if (show_simple) {  // Debugging 實驗的程式, 不用秀出來
    for (int i=0; i<map2.length-1; i++) {
      int [] map3 = map2[i];
      for (int j=0; j<map3.length; j++) {
        if (map3[j]==0) fill(255);
        else if (map3[j]<0) fill(#4E9CD4);
        else fill(#BDCCDE);
        rect( 400+30*j, 400+30*i, 30, 30);
      }
    }
    int x = pos[1], y = pos[0], dir = pos[2];
    int x2 = 400+30*x+15, y2 = 400+30*y+15;
    fill(#D7B8E5);
    ellipse(x2, y2, 30, 30);
    line(x2, y2, x2+15*cos(dir*radians(90)), y2+15*sin(dir*radians(90)));
  }
}

int magicX(int [][] map2, int i, int j) {
  int di = i - int(map2.length/2.0-1), dj = j - int(map2[i].length/2.0-0.5);  // 離中心的index
  int x = 326 + 45*dj - 45*di - 33, y = 449 + 23*dj + 23*di + 43;  // magic numbers, 未考慮高度
  return x;  // 神奇的座標計算，之後可能會改
}

int magicY(int [][] map2, int i, int j) {
  int di = i - int(map2.length/2.0-1), dj = j - int(map2[i].length/2.0-0.5);  // 離中心的index
  int x = 326 + 45*dj - 45*di - 33, y = 449 + 23*dj + 23*di + 43;  // magic numbers, 未考慮高度
  return y;  // 神奇的座標計算，之後可能會改
}

void draw_bot(int i, int j, int dir, int [][] map2) {
  int h = abs(map2[i][j]);
  int x = magicX(map2, i, j), y = magicY(map2, i, j);  // 神奇的座標計算，之後可能會改
  if(dir==0) draw_bot_bottom_dir0(x, y-h*25);
  if(dir==1) draw_bot_bottom_dir1(x, y-h*25);
  if(dir==2) draw_bot_bottom_dir2(x, y-h*25);
  if(dir==3) draw_bot_bottom_dir3(x, y-h*25);
}

void draw_bot_bottom_dir0(int x, int y) {
  x -=247;
  y -=445;
  texInGame.get("body_pink0001").drawBottom(282+x, 416+y, 0.5);
  texInGame.get("head_pink_forward0001").drawBottom(274+x, 400+y, 0.5);
  texInGame.get("hand_left_pink0001").drawBottom(299+x, 417+y, 0.5);
  texInGame.get("foot_left_pink0001").drawBottom(289+x, 430+y, 0.5);
  texInGame.get("foot_right_pink0001").drawBottom(274+x, 434+y, 0.5);
  texInGame.get("hand_right_pink0001").drawBottom(275+x, 421+y, 0.5);
}

void draw_bot_bottom_dir1(int x, int y) {
  x -=247;
  y -=445;
  texInGame.get("hand_left_pink0001").drawBottom(299+x-26, 417+y, 0.5);
  texInGame.get("foot_left_pink0001").drawBottom(289+x-16, 430+y+1, 0.5);
  texInGame.get("body_pink0001").drawBottom(282+x+1, 416+y, 0.5);
  texInGame.get("head_pink_left0001").drawBottom(274+x-9, 400+y, 0.5);
  texInGame.get("foot_right_pink0001").drawBottom(274+x+11, 434+y+1, 0.5);
  texInGame.get("hand_right_pink0001").drawBottom(275+x+20+1, 421+y+2-1, 0.5);
}

void draw_bot_bottom_dir2(int x, int y) {
  x -=247;
  y -=445;
  texInGame.get("hand_left_pink0001").drawBottom(299+x-26, 417+y, 0.5);
  texInGame.get("foot_left_pink0001").drawBottom(289+x-16, 430+y+1, 0.5);
  texInGame.get("body_pink0001").drawBottom(282+x+1, 416+y, 0.5);
  texInGame.get("head_pink_right0001").drawBottom(274+x-9, 400+y, 0.5);
  texInGame.get("foot_right_pink0001").drawBottom(274+x+11, 434+y+1, 0.5);
  texInGame.get("hand_right_pink0001").drawBottom(275+x+20+1, 421+y+2-1, 0.5);
}

void draw_bot_bottom_dir3(int x, int y) {
  x -=247;
  y -=445;
  texInGame.get("hand_left_pink0001").drawBottom(299+x-26, 417+y, 0.5);
  texInGame.get("foot_left_pink0001").drawBottom(289+x-16, 430+y+1, 0.5);
  texInGame.get("head_pink_back0001").drawBottom(274+x, 400+y, 0.5);
  texInGame.get("body_pink0001").drawBottom(282+x+1, 416+y, 0.5);
  texInGame.get("foot_right_pink0001").drawBottom(274+x+11, 434+y+1, 0.5);
  texInGame.get("hand_right_pink0001").drawBottom(275+x+20+1, 421+y+2-1, 0.5);
}

void show_game() {
  texBG.get("background0001").draw(0, 0);
  texBG.get("bordertop0001").draw(0, 0, 0.5);
  texBG.get("borderbase0001").draw(0, 739, 0.5);
  texBG.get("whitefuzz0002").draw(64, 260, 0.5);
  texBG.get("commandsfuzz0001").draw(678, 0, 0.5);
  texBG.get("question0001").draw(934, 10, 0.5);
  texBG.get("musicoffbtn0001").draw(8, 175, 0.5);

  texInGame.get("backbtnmini0001").draw(10, 10, 0.5);
  texInGame.get("resetbtnmini0001").draw(85, 10, 0.5);
  texInGame.get("mainButton0001").draw(708, 10, 0.5);
  texInGame.get("spdbtnmed0002").draw(8, 95, 0.5);


  draw_game_map(testingID%20);

  texInGame.get("buttonbackbig0001").drawCenter(301, 711, 0.5);  // gray button back
  texInGame.get("buttonfrontbig0001").drawCenter(301, 711, 0.43);  // forward

  texInGame.get("buttonbackbig0001").drawCenter(381, 711, 0.5);  // gray button back
  texInGame.get("buttonfrontbig0013").drawCenter(381, 711, 0.43);  // lighting

  //texInGame.get("buttonfrontbig0004").drawCenter(dx, dy, 0.43);  // turn left
  //texInGame.get("buttonfrontbig0007").drawCenter(dx, dy, 0.43);  // turn right
  //texInGame.get("buttonfrontbig0010").drawCenter(dx, dy, 0.43);  // bump
  //texInGame.get("buttonfrontbig0013").drawCenter(dx, dy, 0.43);  // light
  //texInGame.get("buttonfrontbig0016").drawCenter(dx, dy, 0.43);  // P1
  //texInGame.get("buttonfrontbig0019").drawCenter(dx, dy, 0.43);  // P2
  //texInGame.get("buttonfrontbig0022").drawCenter(dx, dy, 0.43);  // lighting

  texInGame.get("mainSection0002").draw(708, 202, 0.5);  // 第1關的MAIN高度比較低
  fill(#EBE7AA);
  noStroke();
  rect(707, 220, 299, 224);

  //texInGame.get("mainSection0002").draw(708, 122, 0.5);  // 第2關的MAIN高度比較高
  //texInGame.get("p1section0002").draw(708, 377, 0.5);  // 第2關的PROC1 單一時

  //texInGame.get("mainSection0002").draw(708, 122, 0.5);  // 第2關的MAIN高度比較高
  //texInGame.get("p1section0002").draw(708, 380, 0.5);  // 第2關的PROC1 雙使用時
  //texInGame.get("p2section0002").draw(708, 558, 0.5);  // 第2關的PROC2 雙使用時

  //texBG.get("backtile0001").draw(dx,dy, 0.5);  // 會發亮的小磚塊  00-20
}

void show_levelsets() {
  texBG.get("background0001").draw(0, 0);

  texBG.get("bordertop0001").draw(0, 0, 0.5);
  texBG.get("borderbase0001").draw(0, 739, 0.5);
  texBG.get("whitegradient0001").draw(-10, 421, 0.5);
  texBG.get("titles0001").draw(501, 44, 0.5);
  texBG.get("musicoffbtn0001").draw(10, 673, 0.5);

  texBG.get("chipdesign0001").drawBottom(-80, 425, 0.5);
  texBG.get("chipdesign0002").drawBottom( 25, 425, 0.5);
  texBG.get("chipdesign0003").drawBottom(142, 425, 0.5);
  texBG.get("chipdesign0004").drawBottom(228, 425, 0.5);
  texBG.get("chipdesign0005").drawBottom(319, 425, 0.5);
  texBG.get("chipdesign0006").drawBottom(404, 425, 0.5);
  texBG.get("chipdesign0007").drawBottom(482, 425, 0.5);
  texBG.get("chipdesign0001").drawBottom(-80+595, 425, 0.5);
  texBG.get("chipdesign0002").drawBottom( 25+595, 425, 0.5);
  texBG.get("chipdesign0003").drawBottom(142+595, 425, 0.5);
  texBG.get("chipdesign0004").drawBottom(228+595, 425, 0.5);
  texBG.get("chipdesign0005").drawBottom(318+595, 425, 0.5);
  texBG.get("chipdesign0006").drawBottom(403+595, 425, 0.5);
  texBG.get("chipdesign0007").drawBottom(482+595, 425, 0.5);

  texInGame.get("backbtnmini0001").draw(10, 10, 0.5);

  texBoyGirl.get("full_levelsets_girlbot0001").draw(width/2-128, height/2-56, 0.5);
}

void keyPressed() {  // for viewing testing SubTexture
  // Press RIGHT or LEFT to change Texture ID
  if (keyCode==RIGHT) {
    testingID = (testingID+1) % testingTex.names.length;
    testingTex.get(testingID).print();//load(children[ID]);
  } else if (keyCode==LEFT) {
    testingID = (testingID+testingTex.names.length-1) % testingTex.names.length;
    testingTex.get(testingID).print();//load(children[ID]);
  }
}

void mousePressed() {
  if (state==0) {
    state = 2;  // play game directly
  }
}

int dx = 0, dy = 0;
void mouseDragged() {
  dx += (mouseX - pmouseX);
  dy += (mouseY - pmouseY);
  println(dx, dy);
}
