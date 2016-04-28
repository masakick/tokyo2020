
float radius = 90;
PVector rectA = new PVector(radius*((2+sqrt(3))/(sqrt(6)+sqrt(2))),radius/(sqrt(6)+sqrt(2)));
PVector rectB = new PVector(radius*sqrt(3)/2.0,radius*0.5);
PVector rectC = new PVector(radius/sqrt(2),radius/sqrt(2));

void setup(){
  size(900,900);
  noLoop();
}

void draw(){
  translate(width/2 - rectA.x/2,50);
  
  for(int i =1; i<=12; i++){
    
    drawRectOut(rectA);
    translate(rectA.x,0);
    rotate(15.0*PI/180);
    
    drawRectIn(rectB);
    translate(rectB.x,0);
    if(i!=12)rotate(15.0*PI/180);
  }

  translate(0,rectB.y);
  rotate(15.0*PI/180);
  translate(0,rectC.y);
  
  for(int i =1; i<=12; i++){
    drawRectOut(rectC);
    translate(rectC.x,0);
    rotate(15.0*PI/180);
  
    drawRectIn(swap(rectB));
    translate(swap(rectB).x,0);
    if(i!=12)rotate(15.0*PI/180);
  }
  
  translate(0,swap(rectB).y);
  rotate(15.0*PI/180);
  translate(0,swap(rectA).y);
  
  for(int i =1; i<=12; i++){
    drawRectOut(swap(rectA));
    translate(swap(rectA).x,0);
    rotate(30.0*PI/180);
  }

}

void drawRectIn(PVector vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,vec.y);
  vertex(0,vec.y);
  endShape(CLOSE);
}

void drawRectOut(PVector vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,-vec.y);
  vertex(0,-vec.y);
  endShape(CLOSE);
}

PVector swap(PVector vec){
  PVector swappedVec = new PVector(vec.y,vec.x);
  return swappedVec;
}