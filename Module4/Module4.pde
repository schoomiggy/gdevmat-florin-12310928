Walker[] walker = new Walker[100];

void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    
    walker[i].setRandomScale();
    walker[i].setRandomColor();
    walker[i].setGaussianPosition(); 
  }
}

void draw()
{
  background(80); 
  
  renderWalker(); 
}

void renderWalker()
{
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].update();
    walker[i].render();
  }
}
