import peasy.*;
PeasyCam cam;

PMatrix mat_scene;

float boxSize, halfBox;

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15;

void setup(){
 size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
 mat_scene = getMatrix();
 cam = new PeasyCam(this, 100);
 cam.lookAt( width / 2, height / 2, 100 );
  
 canvas = createGraphics( canvas_width, canvas_height, P3D ); 
 
 boxSize = canvas.width / 10;
 halfBox = boxSize / 2;
 
}

void draw(){
  canvas.beginDraw();
 
  canvas.smooth();
  canvas.background(15);
  canvas.noFill();
  canvas.strokeWeight( 25 );
 
  Cube newCube = new Cube();
  canvas.translate( canvas.width / 2, canvas.height / 2, 0 );
  newCube.drawRefs();
 
  canvas.endDraw();
  
  setMatrix( mat_scene );
  image(canvas, 0, 0, width, height);
}
