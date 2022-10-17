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
