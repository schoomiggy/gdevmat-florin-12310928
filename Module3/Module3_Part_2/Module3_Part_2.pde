void setup()
{
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size (1080, 720, P3D); 
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  PVector mouse = mousePos();
  
  // red outer glow
  strokeWeight(10);
  stroke(255, 0, 0);
  
  mouse.normalize().mult(500);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // white inner glow
  strokeWeight(5);
  stroke(255);
  
  mouse.normalize().mult(497);
  line(0, 0, mouse.x, mouse.y);
  
  println(mouse.mag()); // print one side of inner glow
  
  line(0, 0, -mouse.x, -mouse.y);
  
  // black handle
  strokeWeight(15);
  stroke(0);
  
  mouse.normalize().mult(60);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}
