Walker[] walker = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walker.length; i++)
  {
    int size = 10 - i;
    
    walker[i] = new Walker();
    walker[i].mass = size;
    walker[i].scale = walker[i].mass * 15;
    walker[i].position = new PVector(-500, 200);
    walker[i].setRandomColor();
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
    walker[i].render();
    
    walker[i].update();
    walker[i].applyForce(wind);
    walker[i].applyForce(gravity);
    
    walker[i].checkEdges();
  }
}
