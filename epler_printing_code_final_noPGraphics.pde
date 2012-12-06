import peasy.*;
PeasyCam cam;

ArrayList<Cube> cubes = new ArrayList();
float boxSize, halfBox, barWidth;
int tDimension, spacer, sides;
float middleX;

void setup(){
 size( 495, 765, P3D  );
 //translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
 ortho( -width/2, width/2, height/2, -height/2, -1000, 1000 );
  
 boxSize = width / 30;
 halfBox = boxSize / 2;
 barWidth = 0.5;
 tDimension = 5;
 spacer = 4;
 sides = 3;

 cam.lookAt( ((boxSize * tDimension) + (boxSize * spacer)), ((boxSize * tDimension) + (boxSize * spacer)) * -1, ((boxSize * tDimension) + (boxSize * spacer)) );
 
 fill( 255 );
 noStroke();
 strokeWeight( 1 );
 smooth();

 for( int y = 0; y < tDimension; y++ ) 		 // generate cubes one vertical level at a time
 {
 	for( int x = 0; x < tDimension; x++ )
 	{
 		for( int z = 0; z < tDimension; z++ )
 		{
 			Cube newCube = new Cube( sides, x * boxSize * spacer, y * boxSize * spacer * -1, z * boxSize * spacer );
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
