class Cube 
{
  
 PVector center, A, B, C, D, E, F, G, H;
 ArrayList edges = new ArrayList(); 
 
 // ---------------------------------------------- CONSTRUCTOR //
 Cube () 
 {
  setVectors();

  resetArrayList();

  canvas.pushMatrix();

  for( int i = 0; i < 6; i++ )
  {
    int ran = floor( random( 0, edges.size() ) );
    Value thisValue = (Value) edges.get( ran );
    drawLines( thisValue.num );
    edges.remove( thisValue );
  }
  canvas.popMatrix();
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
  strokeWeight( 25 );
  stroke( 1, 1, 0.75 );
  switch( _i )
  {
  // --------------------------------------------- Top //
    case 0:  canvas.line( A.x, A.y, A.z, B.x, B.y, B.z );  break;
    case 1:  canvas.line( B.x, B.y, B.z, C.x, C.y, C.z );  break;
    case 2:  canvas.line( C.x, C.y, C.z, D.x, D.y, D.z );  break;
    case 3:  canvas.line( D.x, D.y, D.z, A.x, A.y, A.z );  break;

  // ------------------------------------------ Bottom //
    case 4:  canvas.line( E.x, E.y, E.z, F.x, F.y, F.z );  break;
    case 5:  canvas.line( F.x, F.y, F.z, G.x, G.y, G.z );  break;
    case 6:  canvas.line( G.x, G.y, G.z, H.x, H.y, H.z );  break;
    case 7:  canvas.line( H.x, H.y, H.z, E.x, E.y, E.z );  break;

  // ---------------------------------------- Supports //
    case 8:  canvas.line( A.x, A.y, A.z, E.x, E.y, E.z );  break;
    case 9:  canvas.line( B.x, B.y, B.z, F.x, F.y, F.z );  break;
    case 10: canvas.line( C.x, C.y, C.z, G.x, G.y, G.z );  break;
    case 11: canvas.line( D.x, D.y, D.z, H.x, H.y, H.z );  break;
  }
}



 void drawRefs()  
 {
  // ------------------------------------ XYZ Guides //
  canvas.stroke( 255, 0, 0 );
  canvas.line( 0, 0, 0, 25, 0, 0 );
  canvas.stroke( 0, 255, 0 );
  canvas.line( 0, 0, 0, 0, 25, 0 );
  canvas.stroke( 0, 0, 255 );
  canvas.line( 0, 0, 0, 0, 0, 25 );
  // --------------------------------------- Ref Box //
  canvas.stroke( 255 );
  canvas.box( boxSize );
 }
  
}
