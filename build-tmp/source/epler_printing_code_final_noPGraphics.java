import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import peasy.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class epler_printing_code_final_noPGraphics extends PApplet {


PeasyCam cam;
ArrayList<Cube> cubes = new ArrayList();

float boxSize, halfBox, barWidth, levels;
int cubeCounter = 0;

public void setup(){
 size( 495, 765, P3D  );
 translate( width / 2, height / 2, 0 );
 cam = new PeasyCam(this, 100);
  
 boxSize = width / 20;
 halfBox = boxSize / 2;
 barWidth = 2;
 levels = 2;
 
 fill( 255 );
 noStroke();
 strokeWeight( 1 );
 smooth();


 for( int i = 1; i < levels + 1; i++ ) 		 // generate cubes one vertical level at a time
 {
 	Cube nextLevelCenter = new Cube( 12, 0, boxSize * -1 * i, 0 );
 	cubes.add( nextLevelCenter );
 	cubeCounter += 1;

 	int cubeNum = floor( random( 3, 6 ) ); // number of cubes on this level
	
 	for( int j = 0; j < cubeNum; j++ )     				
 	{	
 		int direction;

 		Cube lastCube = cubes.get( cubeCounter - 1 ); 	// reference the last cube for position
 		
 		ArrayList openSides = new ArrayList();			// fill up an array with possible directions
 		for( int k = 1; k < 5; k++ )
 		{
 			Value optionValue = new Value( k );
 			openSides.add( optionValue );
 		}

 		if( lastCube.neighbors.size() > 0 )							// if the last cube has at least one neighbor...
 		{
 		  for( int m = 0; m < lastCube.neighbors.size(); m++)		// look at all its neighbor values
 		  {
 		  	Value thisValue = (Value) lastCube.neighbors.get( m );
 		  	for(int n = 0; n < openSides.size(); n++ )				// remove neighbor values from possible options
 		  	{
 		  		Value optionValue = (Value) openSides.get( n );
 		  		if( optionValue.num == thisValue.num )
 		  		{
 		  			openSides.remove( optionValue );
 		  		}
 		  	}
 		  }

 		  int optionPicker = floor( random( 0, openSides.size() ) ); 	// from the available options left, pick one
 		  Value directionValue = (Value) openSides.get( optionPicker ); // get that corresponding number so we can pass it
 		  direction = directionValue.num;  								// 1 = left, 2 = right, 3 = back
 		  addCube( direction, i, cubeCounter );

 		} else {
 			direction = floor( random( 1, 4 ) ); // pick any direction 
			addCube( direction, i, cubeCounter );
 		}
 	}
 }
 for( int i = 0; i < cubes.size(); i++ )
 {
 	Cube thisCube = cubes.get( i );
 	println(thisCube.posX + ", " + thisCube.posY + ", " + thisCube.posZ );
 }
}


public void draw()
{
 background( 15 );
 println( cubes.size() );
 
  for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.render();
    text(i, thisCube.posX, thisCube.posY, thisCube.posZ );
  }
}


public void addCube( int _i, int _y, int _counter ) 
{
    Cube lastCube = cubes.get( _counter - 1 );
    Cube newCube = new Cube();
    Value thisValue;
    float posY = _i * -1 * boxSize;
    
	switch( _i ){

		case 1:
		newCube = new Cube( 12, lastCube.posX - boxSize, posY, 0 );
		thisValue = new Value( 2 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;

		case 2:
		newCube = new Cube( 12, lastCube.posX + boxSize, posY, 0 );
		thisValue = new Value( 1 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;

		case 3:
		newCube = new Cube( 12, 0, posY, lastCube.posZ + boxSize );
		thisValue = new Value( 4 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;

		case 4:
		newCube = new Cube( 12, 0, posY, lastCube.posZ - boxSize );
		thisValue = new Value( 3 );
		newCube.neighbors.add( thisValue );
		cubes.add( newCube );
		cubeCounter += 1;
		break;
}

}
class Cube 
{
  
 PVector center, A, B, C, D, E, F, G, H;
 ArrayList edgeValues = new ArrayList();
 int[] edges;
 int edgeCount;
 float posX, posY, posZ;
 ArrayList neighbors = new ArrayList();
 
 // ---------------------------------------------- CONSTRUCTORS //
 Cube() 
 {
 }
 
 Cube ( int _edgeCount, float _x, float _y, float _z ) 
 {
  edgeCount = _edgeCount;
  edges = new int[ edgeCount ];
  posX = _x;
  posY = _y;
  posZ = _z;
  setVectors();
  setEdges();
 }


// ----------------------------------------------- FUNCTIONS //

public void setVectors() 
 {
  center = new PVector( 0, 0, 0 );
// --------------------------------------------- Top //
  A = new PVector( center.x - halfBox, center.y - halfBox, center.z + halfBox );
  B = new PVector( center.x + halfBox, center.y - halfBox, center.z + halfBox );
  C = new PVector( center.x + halfBox, center.y - halfBox, center.z - halfBox );
  D = new PVector( center.x - halfBox, center.y - halfBox, center.z - halfBox );
// ------------------------------------------ Bottom // 
  E = new PVector( center.x - halfBox, center.y + halfBox, center.z + halfBox );
  F = new PVector( center.x + halfBox, center.y + halfBox, center.z + halfBox );
  G = new PVector( center.x + halfBox, center.y + halfBox, center.z - halfBox );
  H = new PVector( center.x - halfBox, center.y + halfBox, center.z - halfBox );
 }


public void render()
{
  pushMatrix();
    translate( posX, posY, posZ );
    for( int i = 0; i < edges.length; i++ )
    {
      drawSingleEdge( edges[i] );
    }
  popMatrix();
}
 
 
  public void setEdges()
 {
  edgeValues.clear();

  // fill up the array with values 1 - 12
  for( int i = 0; i < 12; i++ )
  {
    Value thisValue = new Value( i );
    edgeValues.add( thisValue );
  }
  /* from 0 to edgeCount, pick a random value between 0 
  and the size of the ArrayList and add it to edges array. 
  These are the ones that will get drawn.
  Then remove the Value from the ArrayList of possible
  edges so we don't draw it twice.
  */
  for( int i = 0; i < edgeCount; i++ )
  {
    int ran = floor( random( 0, edgeValues.size() ) );
    Value thisValue = ( Value ) edgeValues.get( ran );
    edges[ i ] = thisValue.num;
    edgeValues.remove( thisValue );
  }
  
 }



public void drawSingleEdge( int _i ) 
{
  switch( _i )
  {
   /*----------------------------------------------- TOP EDGES */
   case 0:
   pushMatrix();
    translate( A.x, A.y, A.z );
    translate( halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 1:
   pushMatrix();
    translate( B.x, B.y, B.z );
    translate( 0, 0, -halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
  
   case 2:
   pushMatrix();
    translate( C.x, C.y, C.z );
    translate( -halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 3:
   pushMatrix();
    translate( D.x, D.y, D.z );
    translate( 0, 0, halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
   
   /*-------------------------------------------- BOTTOM EDGES */
   case 4:
   pushMatrix();
    translate( E.x, E.y, E.z );
    translate( halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 5:
   pushMatrix();
    translate( F.x, F.y, F.z );
    translate( 0, 0, -halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
  
   case 6:
   pushMatrix();
    translate( G.x, G.y, G.z );
    translate( -halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 7:
   pushMatrix();
    translate( H.x, H.y, H.z );
    translate( 0, 0, halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
  
   /*-------------------------------------------- VERTICAL EDGES */
   case 8:
   pushMatrix();
    translate( E.x, E.y, E.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
  
   case 9:
   pushMatrix();
    translate( F.x, F.y, F.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
  
   case 10:
   pushMatrix();
    translate( G.x, G.y, G.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
  
   case 11:
   pushMatrix();
    translate( H.x, H.y, H.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
   } // end of sweitch
}



 public void drawRefs()  
 {
  // ------------------------------------ XYZ Guides //
  stroke( 255, 0, 0 );
  line( 0, 0, 0, 25, 0, 0 );
  stroke( 0, 255, 0 );
  line( 0, 0, 0, 0, 25, 0 );
  stroke( 0, 0, 255 );
  line( 0, 0, 0, 0, 0, 25 );
  // --------------------------------------- Ref Box //
  stroke( 255 );
  box( boxSize );
 }
  
}
class Value
{
  int num;

  Value ( int _i )
  {
    num = _i;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "epler_printing_code_final_noPGraphics" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
