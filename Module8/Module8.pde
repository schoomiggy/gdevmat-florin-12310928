Walker[] matter = new Walker[10];

void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
   for (int i = 0; i < matter.length; i++)
  {
    float randomMass = random(2,20);
    
    matter[i] = new Walker();
    matter[i].setGaussianPosition();
    matter[i].mass = randomMass;
    matter[i].scale = matter[i].mass * 10;
    matter[i].setRandomColor();
  }
}

void draw()
{
  background(255); 
  
  background(255);

  for (int i = 0; i < matter.length; i++)
  {
    for (int j = 0; j < matter.length; j++)
    {
      if (i != j)
      {
        PVector force = matter[j].calculateAttraction(matter[i]);
        matter[i].applyForce(force);
      }
    }
  }

  for (Walker m : matter)
  {
    m.update();
    m.render();
  }
}
