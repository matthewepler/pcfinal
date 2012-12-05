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
 barWidth = 2;
 
 fill( 255 );
 noStroke();
 strokeWeight( 1 );
 smooth();
 
 for( int i = 0; i < 3; i++ )
 {
 	Cube newCube = new Cube( 12, 0, 0, i * boxSize );
 	cubes.add( newCube );
	Cube newCube2 = new Cube( 12, 0, 0, i * boxSize * -1 );
	cubes.add( newCube2 );
 }
}


void draw()
{
 background( 15 );
 
  for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.render();
  }
}
