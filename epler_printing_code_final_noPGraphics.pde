import peasy.*;
PeasyCam cam;
ArrayList<Cube> cubes = new ArrayList();

float boxSize, halfBox, barWidth, tDimension;
int cubeCounter = 0;

void setup(){
 size( 495, 765, P3D  );
 translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
  
 boxSize = width / 20;
 halfBox = boxSize / 2;
 barWidth = 2;
 tDimension = 3;
 
 fill( 255 );
 noStroke();
 strokeWeight( 1 );
 smooth();


 for( int y = 1; y < tDimension + 1; y++ ) 		 // generate cubes one vertical level at a time
 {
 	for( int x = 0; x < tDimension + 1; x++ )
 	{
 		for( int z = 0; z < tDimension + 1; z++ )
 		{
 			Cube newCube = new Cube( 3, x * boxSize * 2, y * boxSize * 2 * -1, z * boxSize * 2 );
 			cubes.add( newCube );
 		}
 	}
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

