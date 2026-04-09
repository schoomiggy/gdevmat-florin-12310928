void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

Walker perlinWalker = new Walker();

void draw()
{
  perlinWalker.render();
  perlinWalker.perlinWalk();
}
