
float radius = 100;
PVector rectA = new PVector(radius*((2+sqrt(3))/(sqrt(6)+sqrt(2))),radius/(sqrt(6)+sqrt(2)));
PVector rectB = new PVector(radius*sqrt(3)/2.0,radius*0.5);
PVector rectC = new PVector(radius/sqrt(2),radius/sqrt(2));

PVector defv = new PVector(100,100);

void setup(){
  size(400,400);
  noStroke();
  noLoop();
}

void draw(){
  
  //Aの三角形
  fill(0,0,255);
  beginShape();
  vertex(defv.x,defv.y);
  vertex(defv.x+rectA.x,defv.y);
  vertex(defv.x+rectA.x,defv.y+rectA.y);
  endShape(CLOSE);
  
  defv = new PVector(100,200);
  
  //Bの三角形
  fill(255,0,0);
  beginShape();
  vertex(defv.x,defv.y);
  vertex(defv.x+rectB.x,defv.y);
  vertex(defv.x+rectB.x,defv.y+rectB.y);
  endShape(CLOSE);
  
  defv = new PVector(100,300);
  
  //Cの三角形
  fill(0,128,32);
  beginShape();
  vertex(defv.x,defv.y);
  vertex(defv.x+rectC.x,defv.y);
  vertex(defv.x+rectC.x,defv.y+rectC.y);
  endShape(CLOSE);
  
  //Aの四角形
  fill(0,0,255);
  pushMatrix();
  translate(200,100);
  drawRect(rectA);
  popMatrix();
  
  //Bの四角形
  fill(255,0,0);
  pushMatrix();
  translate(200,200);
  drawRect(rectB);
  popMatrix();
  
  //Cの四角形
  fill(0,128,32);
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