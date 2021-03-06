
var radius = 70;
var rectA = new p5.Vector(radius*Math.cos(15*Math.PI/180),radius*Math.sin(15*Math.PI/180));
var rectB = new p5.Vector(radius*Math.cos(30*Math.PI/180),radius*Math.sin(30*Math.PI/180));
var rectC = new p5.Vector(radius*Math.cos(45*Math.PI/180),radius*Math.sin(45*Math.PI/180));

function setup() {
  createCanvas(900,900);
  fill(30);
  noStroke();
  noLoop();
}

function draw() {
  translate(width/2 - rectA.x/2,50);
  
  for(var i =1; i<=12; i++){
    
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
  
  for(var i =1; i<=12; i++){
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
  
  for(var i =1; i<=12; i++){
    drawRectOut(swap(rectA));
    translate(swap(rectA).x,0);
    rotate(30.0*PI/180);
  }

}

function drawRectIn(vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,vec.y);
  vertex(0,vec.y);
  endShape(CLOSE);
}

function drawRectOut(vec){
  beginShape();
  vertex(0,0);
  vertex(vec.x,0);
  vertex(vec.x,-vec.y);
  vertex(0,-vec.y);
  endShape(CLOSE);
}

function swap(vec){
  var swappedVec = new p5.Vector(vec.y,vec.x);
  return swappedVec;
}