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
