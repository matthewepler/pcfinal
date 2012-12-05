import peasy.*;
PeasyCam cam;
ArrayList<Cube> cubes = new ArrayList();

float boxSize, halfBox, barWidth;
float rotation = 0;

void setup(){
 size( 495, 765, P3D  );
 translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
  
 boxSize = width / 20;
 halfBox = boxSize / 2;
 barWidth = 5;
 
 noFill();
 stroke( 255 );
 strokeWeight( 1 );
 smooth();
 
 Cube newCube = new Cube( 6 );
 cubes.add( newCube );
}


void draw()
{
 background( 15 );
 
  for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.drawEdges();
  }
}
