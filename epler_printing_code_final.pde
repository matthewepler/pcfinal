PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15;

void setup(){
 size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
 canvas = createGraphics( canvas_width, canvas_height, P2D ); 
 canvas.beginDraw();
 canvas.colorMode( HSB, 1, 1, 1 );
 canvas.smooth();
 canvas.background(255);
 canvas.fill(0);
 canvas.ellipse(canvas_width/2, canvas_height/2, 500, 500);
 //canvas.save("wetSharp.tif"); 
 canvas.endDraw();

 image(canvas, 0, 0, width, height);
}

void draw(){
 
