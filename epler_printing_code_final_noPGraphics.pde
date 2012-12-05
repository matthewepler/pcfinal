import peasy.*;
PeasyCam cam;
ArrayList<Cube> cubes = new ArrayList();

float boxSize, halfBox, barWidth, levels;
int cubeCounter = 0;

void setup(){
 size( 495, 765, P3D  );
 translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
  
 boxSize = width / 20;
 halfBox = boxSize / 2;
 barWidth = 2;
 levels = 5;
 
 fill( 255 );
 noStroke();
 strokeWeight( 1 );
 smooth();


 for( int i = 0; i < levels + 1; i++ ) 		  			// generate cubes one vertical level at a time
 {
 	Cube nextLevelCenter = new Cube( 12, 0, boxSize * -1 * i, 0 );
 	cubes.add( nextLevelCenter );
 	cubeCounter += 1;

 	int ranNum = floor( random( 8, 13 ) / ( i * 1.5 ) ); // number of cubes on this level
	
 	for( int j = 0; i < ranNum; j++ )     				
 	{	
 		int direction;

 		Cube lastCube = cubes.get( cubeCounter - 1 ); 		// reference the last cube for position
 		
 		ArrayList openSides = new ArrayList();		// fill up an array with possible directions
 		for( int k = 1; k < 5; k++ )
 		{
 			Value optionValue = new Value( k );
 			openSides.add( optionValue );
 		}

 		if( lastCube.neighbors.size() > 0 )				// if the last cube has at least one neighbor...
 		{
 		  for( int m = 0; m < lastCube.neighbors.size(); m++)
 		  {
 		  	Value thisValue = (Value) lastCube.neighbors.get( m );
 		  	for(int n = 0; n < openSides.size(); n++ )
 		  	{
 		  		Value optionValue = (Value) openSides.get( n );
 		  		if( optionValue.num == thisValue.num )
 		  		{
 		  			openSides.remove( optionValue );
 		  		}
 		  	}
 		  }

 		  int optionPicker = floor( random( 0, openSides.size() ) );
 		  Value directionValue = (Value) openSides.get( optionPicker );
 		  direction = directionValue.num;
                  // 1 = left, 2 = right, 3 = back, 4 = front
 		  addCube( direction, cubeCounter );
                  println( "added cube with direction " + direction );
                  println( "cubeCounter = " + cubeCounter );

 		} else {
 			direction = floor( random( 1, 5 ) ); 		// pick a direction relative to last cube. 
			// 1 = left, 2 = right, 3 = back, 4 = front
			addCube( direction, cubeCounter );
                        println("added free cube" );
                        println( "cubeCounter = " + cubeCounter );
 		}
 	}
 }
}


void draw()
{
 background( 15 );
 println( cubes.size() );
 
  for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.render();
  }
}


void addCube( int _i, int _counter ) 
{
    println( "addCube initiated" );
    Cube lastCube = cubes.get( _counter - 1 );
    Cube newCube = new Cube();
    Value thisValue;
    
	switch( _i ){

		case 1:
		newCube = new Cube( 12, lastCube.posX - boxSize, 0, 0 );
		thisValue = new Value( 1 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;

		case 2:
		newCube = new Cube( 12, lastCube.posX + boxSize, 0, 0 );
		thisValue = new Value( 2 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;

		case 3:
		newCube = new Cube( 12, 0, 0, lastCube.posZ + boxSize );
		thisValue = new Value( 3 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;

		case 4:
		newCube = new Cube( 12, 0, 0, lastCube.posZ - boxSize );
		thisValue = new Value( 4 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;
}
println( "cubeCounter = " + cubeCounter );
}
