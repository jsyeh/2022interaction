PVector []p;
PVector []x;
PVector []v;
int N=5;
float []w = new float[N*N];
float dt=1;
void setup(){  // line 1..3
  size(500,500);
  reset();
}
void draw(){  // line 4...16
  background(#FFFFF2);
  for(int ii=0; ii<N; ii++){
    for(int jj=0; jj<N-1; jj++){
      int i = ii*N+jj;
      int j = jj*N+ii;
      line(x[i].x, x[i].y, x[i+1].x, x[i+1].y);
      line(x[j].x, x[j].y, x[j+N].x, x[j+N].y);
    }
  }
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      ellipse(x[i*5+j].x, x[i*5+j].y, 5, 5);
      fill(0); text(""+(i*5+j), x[i*5+j].x, x[i*5+j].y);
    }
  }
  algorithm();
}
void reset(){
  x = new PVector[N*N];
  v = new PVector[N*N];
  p = new PVector[N*N];
  for(int i=0; i<N*N; i++){
    int jj=i%N, ii=int(i/N);
    p[i] = new PVector();
    x[i] = new PVector(100+jj*70, 100+ii*70, random(-0.0001, +0.0001) );
    v[i] = new PVector();
    w[i] = 1.0/(N*N);  // 1.0/5.0
  }
  w[0] = 0; //m[0]~~無限大
}
int solverIteration=3;
void algorithm(){
  for(int i=0; i<N*N; i++){
    // v[i] = v[i] + dt*w[i]* f_ext(xi)
    if(mousePressed && i!=0) v[i].add( new PVector(dt*w[i],0,0) );
    if(i!=0) v[i].add(new PVector(0, 0.98, 0) );
    p[i] = PVector.add(x[i], PVector.mult(v[i], dt) );
  }
  //generateCollisionConstraints();
  for(int t=0; t<solverIteration; t++){
    projectConstraints();
  }
  p[4] = new PVector(mouseX, mouseY); //用你的mouse控制右上角的點
  for(int i=0; i<N*N; i++){
    v[i] = PVector.sub(p[i], x[i]).div(dt);
    x[i].set(p[i]);//小心!! x[i]=p[i]其實是傳參考
  }
  //velocityUpdate();
}
float d = 60;
void projectConstraints(){ //目標:算出dx 改變量!
  for(int ii=0; ii<N; ii++){
    for(int jj=0; jj<N-1; jj++){
      //4*5+5*4=40個constraints, 算出 80個移動量
      int i = ii*N+jj;
      int j = jj*N+ii;
      //line(x[i].x, x[i].y, x[i+1].x, x[i+1].y);
      projectOneConstraint(i, i+1);
      //line(x[j].x, x[j].y, x[j+N].x, x[j+N].y);
      projectOneConstraint(j, j+N);
    }
  }
  //for(int i=0; i<4; i++){//4個constraints, 算出8個移動量
  //  //line(x[i].x, x[i].y, x[i+1].x, x[i+1].y);
  //  PVector x12 = PVector.sub(p[i],p[i+1] );
  //  PVector n = PVector.div(x12, x12.mag() );
  //  PVector dx1 = PVector.mult(n, -w[i]/(w[i]+w[i+1])*(x12.mag()-d) );
  //  PVector dx2 = PVector.mult(n, +w[i+1]/(w[i]+w[i+1])*(x12.mag()-d) );
  //  p[i].add(dx1);//x[i] += dx1;
  //  p[i+1].add(dx2);//x[i+1] += dx2;
  //}
}
void projectOneConstraint( int i, int j ) {
    PVector x12 = PVector.sub(p[i],p[j] );
    PVector n = PVector.div(x12, x12.mag() );
    PVector dx1 = PVector.mult(n, -w[i]/(w[i]+w[j])*(x12.mag()-d) );
    PVector dx2 = PVector.mult(n, +w[j]/(w[i]+w[j])*(x12.mag()-d) );
    p[i].add(dx1);//x[i] += dx1;
    p[j].add(dx2);//x[i+1] += dx2;  
}
