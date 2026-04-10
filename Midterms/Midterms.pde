Walker target = new Walker();
Walker[] matter = new Walker[100];

int frames = 0;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);

  for (int i = 0; i < matter.length; i++)
  {
    matter[i] = new Walker();

    matter[i].velocity = new PVector(5, 5);
    matter[i].acceleration = new PVector(-0.01, 0.1);
  }
}

void draw()
{
  background(0);

  renderMatter();
  renderBlackHole();
  countFrames();
}

void renderMatter()
{
  for (int i = 0; i < matter.length; i++)
  {
    matter[i].render();

    if (frames == 0)
    {
      matter[i].setRandomScale();
      matter[i].setRandomColor();
      matter[i].setGaussianPosition(); 
    }
    else if (frames > 0)
    {
      PVector direction = PVector.sub(target.position, matter[i].position);
      matter[i].move(direction); 
    }
  }
}

void renderBlackHole()
{
  target.render();

  if (frames == 0)
  {
    target.setGaussianPosition(); 
    
    target.scale = 50;                  
    target.walkerColor = color(255);  
  }
}

void countFrames()
{
  if (frames > 200)
  {
    background(0);
    frames = 0;
  }
  else
  {
    frames++;
  }
}
