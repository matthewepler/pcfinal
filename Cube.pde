class Cube 
{
  
 PVector center, A, B, C, D, E, F, G, H;
 ArrayList edges = new ArrayList(); 
 
 // ---------------------------------------------- CONSTRUCTOR //
 Cube () 
 {
  setVectors();

  resetArrayList();

  pushMatrix();

  for( int i = 0; i < 6; i++ )
  {
    int ran = floor( random( 0, edges.size() ) );
    Value thisValue = (Value) edges.get( ran );
    drawLines( thisValue.num );
    edges.remove( thisValue );
  }
  popMatrix();
 }


// ----------------------------------------------- FUNCTIONS //

   void setVectors() 
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
 
 
 
  void resetArrayList()
 {
  if( edges.size() > 0 )
    {
      edges.clear();
    }

  for( int i = 0; i < 12; i++ )
    {
      Value newValue = new Value( i );
      edges.add( newValue );
    }
 }



 void drawLines( int _i )
 {
  switch( _i )
  {
  // --------------------------------------------- Top //
    case 0:  line( A.x, A.y, A.z, B.x, B.y, B.z );  break;
    case 1:  line( B.x, B.y, B.z, C.x, C.y, C.z );  break;
    case 2:  line( C.x, C.y, C.z, D.x, D.y, D.z );  break;
    case 3:  line( D.x, D.y, D.z, A.x, A.y, A.z );  break;

  // ------------------------------------------ Bottom //
    case 4:  line( E.x, E.y, E.z, F.x, F.y, F.z );  break;
    case 5:  line( F.x, F.y, F.z, G.x, G.y, G.z );  break;
    case 6:  line( G.x, G.y, G.z, H.x, H.y, H.z );  break;
    case 7:  line( H.x, H.y, H.z, E.x, E.y, E.z );  break;

  // ---------------------------------------- Supports //
    case 8:  line( A.x, A.y, A.z, E.x, E.y, E.z );  break;
    case 9:  line( B.x, B.y, B.z, F.x, F.y, F.z );  break;
    case 10: line( C.x, C.y, C.z, G.x, G.y, G.z );  break;
    case 11: line( D.x, D.y, D.z, H.x, H.y, H.z );  break;
  }
}


void drawAllBoxEdges() 
{
 /*----------------------------------------------- TOP EDGES */
 pushMatrix();
  translate( A.x, A.y, A.z );
  translate( halfBox, 0, 0 );
  box( boxSize + barWidth, barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( B.x, B.y, B.z );
  translate( 0, 0, -halfBox );
  box( barWidth, barWidth, boxSize + barWidth );
 popMatrix();
 
 pushMatrix();
  translate( C.x, C.y, C.z );
  translate( -halfBox, 0, 0 );
  box( boxSize + barWidth, barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( D.x, D.y, D.z );
  translate( 0, 0, halfBox );
  box( barWidth, barWidth, boxSize + barWidth );
 popMatrix();
 
 /*-------------------------------------------- BOTTOM EDGES */
 pushMatrix();
  translate( E.x, E.y, E.z );
  translate( halfBox, 0, 0 );
  box( boxSize + barWidth, barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( F.x, F.y, F.z );
  translate( 0, 0, -halfBox );
  box( barWidth, barWidth, boxSize + barWidth );
 popMatrix();
 
 pushMatrix();
  translate( G.x, G.y, G.z );
  translate( -halfBox, 0, 0 );
  box( boxSize + barWidth, barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( H.x, H.y, H.z );
  translate( 0, 0, halfBox );
  box( barWidth, barWidth, boxSize + barWidth );
 popMatrix();

 /*-------------------------------------------- VERTICAL EDGES */
 pushMatrix();
  translate( E.x, E.y, E.z );
  translate( 0, -halfBox, 0 );
  box( barWidth, boxSize + barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( F.x, F.y, F.z );
  translate( 0, -halfBox, 0 );
  box( barWidth, boxSize + barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( G.x, G.y, G.z );
  translate( 0, -halfBox, 0 );
  box( barWidth, boxSize + barWidth, barWidth );
 popMatrix();
 
 pushMatrix();
  translate( H.x, H.y, H.z );
  translate( 0, -halfBox, 0 );
  box( barWidth, boxSize + barWidth, barWidth );
 popMatrix();
  
}



 void drawRefs()  
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