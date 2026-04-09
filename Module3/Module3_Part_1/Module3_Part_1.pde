void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker bounceWalker = new Walker();

void draw()
{
  // flush the background with black color
  background(0);
  
  // render the circle
  bounceWalker.moveAndBounce();
  bounceWalker.render();
}
