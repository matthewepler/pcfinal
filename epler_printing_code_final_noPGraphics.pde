import peasy.*;
PeasyCam cam;

float boxSize, halfBox, barWidth;
float rotation = 0;

void setup(){
 size( 495, 765, P3D  );
 translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
  
 boxSize = width / 20;
 halfBox = boxSize / 2;
 barWidth = 5;
 
 smooth();
 
}

void draw(){
 
  background( 15 );
  noFill();
  strokeWeight( 1 );
 
  Cube newCube = new Cube();
  newCube.drawRefs();
  newCube.drawAllBoxEdges();

}
