
float radius = 90;
PVector rectA = new PVector(radius*((2+sqrt(3))/(sqrt(6)+sqrt(2))),radius/(sqrt(6)+sqrt(2)));
PVector rectB = new PVector(radius*sqrt(3)/2.0,radius*0.5);
PVector rectC = new PVector(radius/sqrt(2),radius/sqrt(2));

boolean showCircle = false;
boolean showRect = true;
boolean showLoopOrder = false;
boolean showRectType = false;

void setup(){
  size(900,900);
  noStroke();
  
}

void draw(){
  if(showRect && showCircle){
    fill(0,0,0,128);
  }
  else{
    fill(30);
  }
  background(255);
  pushStyle();
  fill(0);
  text("c:showCircle\nr:showRect\no:showLoopOrder\nt:showRectType\ns:saveFrame", 10,30);
  popStyle();
  
  translate(width/2 - rectA.x/2,80);
  
  if(showLoopOrder&&!showCircle){
    fill(0); 
  }
  
  //1回目のループ
  for(int i =1; i<=12; i++){
    
    if(showRectType)fillRect("rectA");
    if(showRect)drawRectOut(rectA);
    if(showCircle)drawCircleOut(rectA);
    
    translate(rectA.x,0);
    rotate(15.0*PI/180);
    
    if(showRectType)fillRect("rectB");
    if(showRect)drawRectIn(rectB);
    if(showCircle)drawCircleIn(rectB);
    
    translate(rectB.x,0);
    if(i!=12)rotate(15.0*PI/180);
  }

  translate(0,rectB.y);
  rotate(15.0*PI/180);
  translate(0,rectC.y);
  
  if(showLoopOrder&&!showCircle){
    fill(100); 
  }

  //2回目のループ
  for(int i =1; i<=12; i++){
    
    if(showRectType)fillRect("rectC");
    if(showRect)drawRectOut(rectC);
    if(showCircle)drawCircleOut(rectC);
    
    translate(rectC.x,0);
    rotate(15.0*PI/180);
  
    if(showRectType)fillRect("rectB");
    if(showRect)drawRectIn(swap(rectB));
    if(showCircle)drawCircleIn(swap(rectB));
    
    translate(swap(rectB).x,0);
    if(i!=12)rotate(15.0*PI/180);
  }

  
  translate(0,swap(rectB).y);
  rotate(15.0*PI/180);
  translate(0,swap(rectA).y);
  
  if(showLoopOrder&&!showCircle){
    fill(200); 
  }
  
  //3回目のループ
  for(int i =1; i<=12; i++){
    
    if(showRectType)fillRect("rectA");
    if(showRect)drawRectOut(swap(rectA));
    if(showCircle)drawCircleOut(swap(rectA));
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

void drawCircleOut(PVector vec){
 pushStyle();
 stroke(255,0,0);
 noFill();
 ellipse(vec.x*0.5, -vec.y*0.5, radius,radius);
 popStyle();
}

void drawCircleIn(PVector vec){
 pushStyle();
 stroke(255,0,0);
 noFill();
 ellipse(vec.x*0.5, vec.y*0.5, radius,radius);
 popStyle();
}

void fillRect(String str){
  switch(str){
  
   case "rectA":
     fill(0,0,255);
     break;
   case "rectB":
     fill(255,0,0);
     break;
   case "rectC":
     fill(0,128,32);
     break;
   default:
     break;
  }
}

PVector swap(PVector vec){
  PVector swappedVec = new PVector(vec.y,vec.x);
  return swappedVec;
}

void keyPressed(){
  switch(key){
   case 'c':
     showCircle = !showCircle;
     break;
   case 'r':
     showRect = !showRect;
     break;
   case 'o':
     showLoopOrder = !showLoopOrder;
     break;
   case 't':
     showRectType = !showRectType;
     break;
   case 's':
     saveFrame("frame-######.png");
     break;
   default:
     break;
  }
  
}