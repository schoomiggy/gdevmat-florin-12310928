Walker[] walker = new Walker[8];

void setup()
{
  size (1080, 720, P3D); 
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initWalkers();
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
    float mew = 0.01f;
    
    if (walker[i].position.x >= 0)
    {
      mew = 0.4f;
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = walker[i].velocity.copy();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(frictionMagnitude);
    walker[i].applyForce(friction);
    
    walker[i].render();
    walker[i].update();

    PVector acceleration = new PVector(0.2, 0);
    walker[i].applyForce(acceleration);
    
    walker[i].checkEdges();
  }
}

void initWalkers()
{
  for (int i = 0; i < walker.length; i++)
  {
    int size = 10 - i;
    int posY = 0;
    
    walker[i] = new Walker();
    walker[i].mass = size;
    walker[i].scale = walker[i].mass * 15;

    posY = 2 * (Window.windowHeight / walker.length) * (i - (walker.length / 2));
    walker[i].position = new PVector(-450, posY);

    walker[i].setRandomColor();
  }
}

void mousePressed()
{
  initWalkers(); 
}
