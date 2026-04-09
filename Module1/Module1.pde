void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(30);
}

void draw()
{
  background(0); 

  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
}

void drawCartesianPlane()
{
  strokeWeight(1); 
  color white = color(255, 255, 255); 
  fill(white); 
  stroke(white); 
  line(300, 0, -300, 0); 
  line(0, 300, 0, -300); 
  
  for (int i = -300; i <= 300; i += 10)
  {
     line(i, -2, i, 2);
     line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  color purple = color(255, 0, 255);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, ((x * -5) + 30), 5);
  }
}

void drawQuadraticFunction()
{
  color yellow = color (255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, ((x * x) + (x * 15) - 3), 5); 
  }
}

void drawSineWave()
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  float frequency = 10;
  float amplitude = 25;
  
  for (int x = -32; x <= 32; x++)
  {
     circle(x * frequency, (float)Math.sin(x) * amplitude, 5);
  }
}
