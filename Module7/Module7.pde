Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walker = new Walker[10];
PVector wind = new PVector(0.1, 0);

void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    int size = int(random(100));
    int posX = 0;
    
    walker[i] = new Walker();
    walker[i].mass = size;
    walker[i].scale = walker[i].mass;

    posX = 2 * (Window.windowWidth / walker.length) * (i - (walker.length / 2));
    walker[i].position = new PVector(posX, 350);

    walker[i].setRandomColor();
  }
}

void draw()
{
  background(255); 
  
  ocean.render();
  renderWalkers();
}

void renderWalkers()
{
  for (Walker w : walker)
  {
    w.update();
    w.render();

    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
    w.applyForce(wind);

    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    //F =  -uNv

    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
