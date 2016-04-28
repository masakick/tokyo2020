
float radius = 100;
PVector rectA = new PVector(radius*((2+sqrt(3))/(sqrt(6)+sqrt(2))),radius/(sqrt(6)+sqrt(2)));
PVector rectB = new PVector(radius*sqrt(3)/2.0,radius*0.5);
PVector rectC = new PVector(radius/sqrt(2),radius/sqrt(2));

PVector defv = new PVector(100,100);

void setup(){
  size(400,400);
  noLoop();
}

void draw(){
  beginShape();
  vertex(defv.x,defv.y);
  vertex(defv.x+rectA.x,defv.y);
  vertex(defv.x+rectA.x,defv.y+rectA.y);
  endShape(CLOSE);
  
  defv = new PVector(100,200);
  
  beginShape();
  vertex(defv.x,defv.y);
  vertex(defv.x+rectB.x,defv.y);
  vertex(defv.x+rectB.x,defv.y+rectB.y);
  endShape(CLOSE);
  
  defv = new PVector(100,300);
  
  beginShape();
  vertex(defv.x,defv.y);
  vertex(defv.x+rectC.x,defv.y);
  vertex(defv.x+rectC.x,defv.y+rectC.y);
  endShape(CLOSE);
  
  pushMatrix();
  translate(200,100);
  drawRect(rectA);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  drawRect(rectB);
  popMatrix();
  
  pushMatrix();
  translate(200,300);
  drawRect(rectC);
  popMatrix();

}






void drawRect(PVector vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,vec.y);
  vertex(0,vec.y);
  endShape(CLOSE);
}