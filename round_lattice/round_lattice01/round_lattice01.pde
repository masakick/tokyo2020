int VNUM = 36;  // 6 or over
float RADIUS = 30;
float rotateAng = 180/float(VNUM);
int rectTypeNum = int(90/rotateAng - 1);
PVector[] rectVec = new PVector[rectTypeNum];

void setup(){
  size(800, 800);
  background(255);
  noStroke();
  noLoop();
  fill(30);
  for(int i=0; i<rectVec.length; i++){
    rectVec[i] = new PVector(RADIUS*cos((i+1)*rotateAng*PI/180),RADIUS*sin((i+1)*rotateAng*PI/180)); 
  }
}

void draw(){
  translate((width-rectVec[0].x)/2, 30);
  for(int j=0; j<VNUM; j++){
    pushMatrix();
    for(int i=0; i<rectVec.length; i++){
      drawRect(rectVec[i]);
      translate(rectVec[i].x,rectVec[i].y);
      rotate(rotateAng*PI/180);
    }
    popMatrix(); 
    translate(rectVec[0].x,rectVec[0].y);
    rotate(rotateAng*PI/180);
    translate(rectVec[1].x,0);
    rotate(rotateAng*PI/180);
    translate(0,-rectVec[0].y);
  }
}

void drawRect(PVector vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,vec.y);
  vertex(0,vec.y);
  endShape(CLOSE);
}