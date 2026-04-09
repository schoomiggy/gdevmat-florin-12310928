public class Walker
{
 public float x;
 public float y;
 public float tx = 0, ty = 10000;
 
 private float tScale = 0;
 
 private float tRed = 100;
 private float tBlue = 200;
 private float tGreen = 300;
 
 void render()
 {
   float scale = map(noise(tScale), 0, 1, 5, 200);
   tScale += 0.01f;
   
   float r = map(noise(tRed), 0, 1, 0, 255);
   float g = map(noise(tBlue), 0, 1, 0, 255);
   float b = map(noise(tGreen), 0, 1, 0, 255);
   
   tRed += 0.1f;
   tBlue += 0.1f;
   tGreen += 0.1f;
   
   color walkerColor = color(r, g, b);
  
   fill(walkerColor);
   noStroke();
   circle(x, y, scale);
 }
 
 void perlinWalk()
 {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -370, 360);
    
    tx += 0.01f;
    ty += 0.01f;
 }
}
