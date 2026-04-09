void setup()
{
  size (1280, 720, P3D); // set window size to 1280 x 720
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gaussian = randomGaussian();
  
  float standardDeviation = 250;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  float y = random(-360, 360);
  
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int a = int(random(10, 100));
    
  color paintColor = color(r, g, b, a);
  
  float scaleGaussian = randomGaussian();
  
  float scaleMean = 50;
  float scaleStandardDeviation = 10;
  
  float scale = scaleStandardDeviation * scaleGaussian + scaleMean;
  
  fill(paintColor);
  noStroke();
  circle(x, y, scale);
}
