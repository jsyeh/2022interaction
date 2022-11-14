size(300,300);

fill(255);
ellipse(150,150,300,300);

fill(0,255,0);
beginShape();
for(int i=0; i<6; i++){
  float angle = radians(i*60);
  //line( 150,150, 150+150*cos(angle), 150+150*sin(angle));
  //ellipse(150+150*cos(angle), 150+150*sin(angle), 8,8);
  vertex(150+150*cos(angle), 150+150*sin(angle));
}
endShape(CLOSE);
