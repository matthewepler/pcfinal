import peasy.*;
PeasyCam cam;

float boxSize, halfBox;
float rotation = 0;

void setup(){
 size( 495, 765, P3D  );
 translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
  
 boxSize = width / 20;
 halfBox = boxSize / 2;
 
 smooth();
 
}

void draw(){
 
  background( 15 );
  noFill();
  strokeWeight( 1 );
 
  Cube newCube = new Cube();
  for( int i = 1; i < 15; i ++ )
  {
    rotateX( rotation );
    rotateY( rotation );
    rotateZ( rotation );
    
    newCube.drawRefs();
    
    rotation += ( HALF_PI / i ) * 0.25;
  }
  
  rotation = 0;

}
